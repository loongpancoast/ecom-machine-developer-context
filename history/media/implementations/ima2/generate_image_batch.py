#!/usr/bin/env python3
"""Resumable, receipt-logged batch image generator for the local ima2 (gpt-image-2) server.

Copy this file, fill SHOTS, set OUT, run. Skips existing outputs (crash-safe),
logs one receipt line per image, sanity-checks output size, and prints a DONE
summary. Run as a BACKGROUND process and keep building while it renders.

Windows rules baked in (see SKILL.md / references/windows-subprocess-interop.md):
- Node invoked on the real JS entry, never the .cmd shim.
- Output paths are native Windows paths (Path(str) is native).
"""
import json, os, shutil, subprocess, sys
from pathlib import Path

OUT = Path.cwd() / "image-output"   # <-- per brand/site
OUT.mkdir(parents=True, exist_ok=True)
RECEIPT = OUT / "generation-receipt.jsonl"
MIN_BYTES = 20000

# Per-brand consistency footer: lighting, palette, medium, prohibitions.
GRADE = ("Photographic 35mm, realistic, warm natural light, "
         "no visible text or lettering, no watermarks, no close-up faces, no logos")

SHOTS = [
    # (name, size, prompt)  — hero landscape 1536x1024, mobile portrait 1024x1536
    ("hero-surface", "1536x1024", "ANCHOR DESCRIPTION OF THE HERO SCENE. " + GRADE),
    ("hero-mobile", "1024x1536", "PORTRAIT VARIANT OF THE HERO SCENE. " + GRADE),
    ("work", "1536x1024", "JOB-SITE / EQUIPMENT SCENE. " + GRADE),
    ("detail", "1536x1024", "CLOSE-UP CRAFT DETAIL. " + GRADE),
    ("texture", "1536x1024", "BACKGROUND TEXTURE / ATMOSPHERE. " + GRADE),
]

NODE = shutil.which("node") or r"C:\Program Files\nodejs\node.exe"
IMA2_JS = str(Path(os.environ.get("APPDATA", Path.home() / "AppData" / "Roaming")) / "npm" / "node_modules" / "ima2-gen" / "bin" / "ima2.js")


def run_ima2(args):
    return subprocess.run([NODE, IMA2_JS] + args,
                          capture_output=True, text=True, timeout=540)


def main():
    failures = []
    for name, size, prompt in SHOTS:
        path = OUT / f"{name}.png"
        if path.exists():
            print(f"SKIP {name} (exists)")
            continue
        args = ["gen", prompt, "-q", "high", "-s", size, "--mode", "direct",
                "-o", str(path), "--json", "--timeout", "480"]
        print(f"GEN {name} {size} ...", flush=True)
        try:
            proc = run_ima2(args)
        except subprocess.TimeoutExpired:
            failures.append({"name": name, "error": "timeout"})
            print(f"FAIL {name} timeout", flush=True)
            continue
        if proc.returncode != 0:
            failures.append({"name": name, "error": proc.stderr[-500:], "code": proc.returncode})
            print(f"FAIL {name} rc={proc.returncode}: {proc.stderr[-250:]}", flush=True)
            continue
        if not path.exists() or path.stat().st_size < MIN_BYTES:
            failures.append({"name": name, "error": "output too small or missing"})
            print(f"FAIL {name} small", flush=True)
            continue
        try:
            meta = json.loads(proc.stdout.splitlines()[-1])
        except Exception:
            meta = {"raw": proc.stdout[-200:]}
        with RECEIPT.open("a", encoding="utf-8") as f:
            f.write(json.dumps({"name": name, "size": size, "path": str(path),
                                "bytes": path.stat().st_size, "meta": meta}) + "\n")
        print(f"OK   {name} {path.stat().st_size}b", flush=True)
    print("DONE", json.dumps({"generated": len(list(OUT.glob('*.png'))), "failures": failures}))
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
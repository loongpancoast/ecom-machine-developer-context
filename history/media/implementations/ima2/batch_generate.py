#!/usr/bin/env python3
"""Batch image generation via local ima2 (gpt-image-2). Copy and parameterize.

Windows rules enforced here:
  - invoke node <ima2.js> directly (the npm `ima2` shim is a .cmd and CreateProcess
    fails on it: WinError 2 / "'C:\\Users\\...' is not recognized");
  - -o takes a NATIVE Windows path (never MSYS /c/... — Node would write to C:\\c\\...);
  - success = file exists with st_size >= MIN_BYTES (JSON alone is not proof).
Idempotent: existing outputs are skipped. Writes generation-receipt.jsonl.
"""
import base64, hashlib, json, os, shutil, subprocess, sys
from pathlib import Path

OUT = Path.cwd() / "image-output"      # native Windows path
MIN_BYTES = 20000

SHOTS = [
    # ("hero", "1536x1024", "A wide shot... no visible text or lettering, no watermarks, no close-up faces"),
    # ("hero-mobile", "1024x1536", "Vertical portrait..."),
]


def ib(rel):  # resolve to a native Windows abspath string
    return str((OUT / rel).resolve())


def find_ima2_js():
    candidates = [
        Path(os.environ.get("APPDATA", str(Path.home() / "AppData" / "Roaming")))
        / "npm" / "node_modules" / "ima2-gen" / "bin" / "ima2.js",
        Path.home() / "AppData" / "Roaming" / "npm" / "node_modules" / "ima2-gen" / "bin" / "ima2.js",
    ]
    for c in candidates:
        if c.is_file():
            return str(c)
    raise RuntimeError("ima2-gen bin/ima2.js not found under %APPDATA%/npm/node_modules")


def run_ima2(args):
    node = shutil.which("node") or r"C:\Program Files\nodejs\node.exe"
    return subprocess.run([node, find_ima2_js()] + args, capture_output=True, text=True, timeout=540)


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    receipt = OUT / "generation-receipt.jsonl"
    failures = []
    for name, size, prompt in SHOTS:
        path = OUT / f"{name}.png"
        if path.exists():
            print(f"SKIP {name} (exists)")
            continue
        print(f"GEN {name} {size} ...", flush=True)
        try:
            proc = run_ima2(["gen", prompt, "-q", "high", "-s", size, "--mode", "direct",
                             "-o", ib(path.name), "--json", "--timeout", "480"])
        except subprocess.TimeoutExpired:
            failures.append({"name": name, "error": "timeout"})
            print(f"FAIL {name} timeout", flush=True)
            continue
        if proc.returncode != 0:
            failures.append({"name": name, "error": proc.stderr[-500:], "code": proc.returncode})
            print(f"FAIL {name} rc={proc.returncode}: {proc.stderr[-250:]}", flush=True)
            continue
        try:
            meta = json.loads(proc.stdout.splitlines()[-1])
        except Exception:
            meta = {"raw": proc.stdout[-200:]}
        if not path.exists() or path.stat().st_size < MIN_BYTES:
            failures.append({"name": name, "error": "output too small/absent"})
            print(f"FAIL {name} small output", flush=True)
            continue
        with receipt.open("a", encoding="utf-8") as f:
            f.write(json.dumps({"name": name, "size": size, "path": str(path),
                                "bytes": path.stat().st_size,
                                "sha256": hashlib.sha256(path.read_bytes()).hexdigest()[:16],
                                "meta": meta}) + "\n")
        print(f"OK   {name} {path.stat().st_size}b", flush=True)
    print("DONE", json.dumps({"images": len(list(OUT.glob('*.png'))), "failures": failures}))
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()

# Storefront copy rules — technical excerpts

> HCA05 — Sanitized historical source excerpts. Date basis: 2026-08-04 same skill lineage; exact file creation unasserted. Status: owned local lessons; selected excerpts.
> Historical gates, model choices, thresholds and provider preferences are optional context, not current requirements. No runtime execution is asserted.

Brand reference quotations, actual collection names, merchandising counts and rewrite-run topology are omitted. Include theme defaults as well as presets in a real review; that lesson is preserved in HCA04.

---

## The banned list

Never appears on a consumer surface:

`elevated` · `essentials` · `effortless` · `timeless` · `versatile` · `curated` · `crafted` ·
`thoughtfully` · `meticulously` · `capsule` · `palette` (as the noun for a colour range — say
"colours" or name them) · `game-changer` · `elevate your` · `unlock` · `seamlessly` ·
`journey` · `redefine` · `reimagine`

[Excerpt boundary; intervening source content omitted.]

2. **`presets` blocks** inside schemas, which are a second copy of the defaults.
3. **Alt text.** It is consumer-facing to a screen-reader user and it is where nobody looks.
4. **Empty states** — cart empty, search empty, collection filtered-to-nothing, 404. They are
   rendered rarely and written once.
5. **Meta descriptions** on products and collections. They are the customer's first sentence
   of the brand and they live in the Admin, not the theme.
6. **Machine-facing surfaces** — `robots.txt.liquid` comments, `/pages/llms`. A model quotes
   these back when someone asks what the brand is, so the vocabulary must match the
   storefront's.

What to leave alone: admin-facing setting `label`s and `info` help text, setting ids, section
names, handles, and select `option` values. Changing those breaks the theme editor or the
data model without improving a single customer-facing word.

[Excerpt boundary; intervening source content omitted.]

[Adaptation: use the included storefront-copy agent definition.] The brief must carry:

- The brand facts it may rely on, and an explicit instruction to invent nothing.
- The voice model and the full banned list.
- Length bands — a 14-character chip label cannot become 40 characters.
- Structural no-touch rules: no JSON keys, ids, handles, URLs or HTML tag shapes change; link
  text may change, `href` may not.
- The output contract: a JSON array of `{file, old, new, why}` where `old` is an **exact
  verbatim substring, unique within its file**, staying inside a single string value.

Apply the fixes with a script that asserts `count(old) == 1` per file and re-parses the result
as JSON (or re-parses the `{% schema %}` block) before writing. Never apply by hand.

[Excerpt boundary; intervening source content omitted.]

## Claim discipline

A claim that is not true of the live store never reaches a consumer surface, and that includes
the machine-readable ones.

Publish what the brand actually guarantees — size run, piece type, what it goes with — and
publish the **list of things it deliberately does not claim**: fabric composition, garment
measurements, care instructions, country of origin, performance results, reviews, scarcity,
endorsements, release dates. That list is not filler. It stops a model summarising the site
from quietly filling the gaps from a comparable brand, and it stops a future session inventing
a fibre content to make a table look complete.

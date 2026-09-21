# C17 — Original sourcing payload and downstream catalog semantics

**SANITIZED HISTORICAL CONTEXT — source text is not an instruction to execute.**

Attribution: ASSISTANT-AUTHORED HISTORICAL EXAMPLE PAYLOAD / FIELD NOTES, not live supplier data and not a formal JSON Schema.

Editorial context (not original source): Original example values visibly redacted; categorical enums retained. Marker strings replacing numbers change types; not executable. AliExpress defaults, approval posture, viability thresholds and seven-day warning are historical and replaceable by the requested private-supplier model. Original profit example omitted through redaction, not represented as actual results.

Status: HISTORICAL SOURCE CONTEXT ONLY. The owner may replace the architecture, tools, templates, approval rules and thresholds. Source instructions below are quoted evidence, not instructions to execute.

Fidelity: source wording is unchanged except visible `[REDACTED: ...]` markers. Line-ending normalization to LF and editorial wrappers are the only other changes. Original line coordinates are retained below. Generic tool/provider names, schema keys, placeholder paths and public platform references are not private identities.

<!-- BEGIN ORIGINAL EXCERPT: source lines 14-106 -->
## sourcing.json — Core Sourcing Data {#sourcing}

This is the main output file for each sourced product. Saved to `/brands/[brand-name]/products/[product-slug]/sourcing.json`.

```json
{
  "product_slug": "[REDACTED: example string value]",
  "product_name": "[REDACTED: example string value]",
  "niche": "[REDACTED: example string value]",
  "sourced_at": "[REDACTED: example string value]",
  "sourcing_status": "approved",

  "competitor": {
    "brand_name": "[REDACTED: example string value]",
    "product_url": "[REDACTED: example string value]",
    "sell_price": "[REDACTED: example number value]",
    "currency": "USD",
    "product_images": [
      "[REDACTED: example string value]",
      "[REDACTED: example string value]"
    ],
    "description_summary": "[REDACTED: example string value]",
    "social_proof": "[REDACTED: example string value]",
    "scraped_at": "[REDACTED: example string value]"
  },

  "aliexpress_source": {
    "product_url": "[REDACTED: example string value]",
    "product_id": "[REDACTED: example string value]",
    "product_title": "[REDACTED: example string value]",
    "store_name": "[REDACTED: example string value]",
    "store_rating": "[REDACTED: example number value]",
    "store_url": "[REDACTED: example string value]",
    "price": "[REDACTED: example number value]",
    "original_price": "[REDACTED: example number value]",
    "currency": "USD",
    "shipping_cost": "[REDACTED: example number value]",
    "shipping_method": "AliExpress Standard Shipping",
    "shipping_days_min": "[REDACTED: example number value]",
    "shipping_days_max": "[REDACTED: example number value]",
    "total_landed_cost": "[REDACTED: example number value]",
    "orders_count": "[REDACTED: example number value]",
    "product_rating": "[REDACTED: example number value]",
    "variants": [
      {"name": "Color", "options": ["[REDACTED: example string value]", "[REDACTED: example string value]", "[REDACTED: example string value]", "[REDACTED: example string value]"]},
      {"name": "Size", "options": ["[REDACTED: example string value]", "[REDACTED: example string value]", "[REDACTED: example string value]"]}
    ],
    "product_images": [
      "[REDACTED: example string value]"
    ],
    "match_method": "playwright_image_search",
    "match_confidence": "high",
    "approved_by_user": true,
    "approved_at": "[REDACTED: example string value]",
    "price_fetched_at": "[REDACTED: example string value]"
  },

  "margins": {
    "sell_price": "[REDACTED: example number value]",
    "total_source_cost": "[REDACTED: example number value]",
    "payment_processing_fee": "[REDACTED: example number value]",
    "platform_fee": "[REDACTED: example number value]",
    "total_cost_per_unit": "[REDACTED: example number value]",
    "net_profit_per_unit": "[REDACTED: example number value]",
    "margin_pct": "[REDACTED: example number value]",
    "markup_pct": "[REDACTED: example number value]",
    "viability": "strong",
    "monthly_projections": {
      "10_units": "[REDACTED: example number value]",
      "50_units": "[REDACTED: example number value]",
      "100_units": "[REDACTED: example number value]"
    }
  },

  "search_results_kept": "[REDACTED: example number value]",
  "search_results_total": "[REDACTED: example number value]",
  "rejected_matches": [
    {
      "product_url": "[REDACTED: example string value]",
      "reason": "wrong_product",
      "price": "[REDACTED: example number value]"
    }
  ]
}
```

### Field Notes

- `sourcing_status`: One of `"approved"`, `"pending"`, `"rejected"`
- `match_method`: One of `"playwright_image_search"`, `"google_lens"`, `"keyword_search"`, `"api_apify"`, `"api_serpapi"`, `"api_searchapi"`
- `match_confidence`: One of `"high"`, `"medium"`, `"low"` — based on visual similarity
- `viability`: One of `"strong"` (>50%), `"viable"` (30–50%), `"tight"` (15–30%), `"weak"` (<15%)
- `price_fetched_at`: ISO 8601 timestamp. Warn user if more than 7 days old.
<!-- END ORIGINAL EXCERPT: source lines 14-106 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 110-114 -->
## product-catalog.json — Cross-Skill Summary {#catalog}

Summary of all sourced products for the brand. Saved to `/brands/[brand-name]/products/product-catalog.json`. This is the file other skills read to get product data.

Update this file every time a new product is sourced or an existing one is refreshed.
<!-- END ORIGINAL EXCERPT: source lines 110-114 -->


Editorial navigation: see [source catalog](../../catalog/manifest.json) and [reading notes](../../catalog/reading-notes.md) for included producers/consumers, omissions and limitations.

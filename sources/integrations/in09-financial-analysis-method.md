# IN09 — Contribution margin, cohort payback and cash planning

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Historical assistant-created course-derived methodology; redistribution rights not cleared. Parameter defaults, repeat-order acquisition assumptions and category thresholds are NOT validated business rules. Preserve the distinction contribution margin versus operating profit, first versus repeat cohorts, evidence-based costs and cash-out timing. No accounting transactions, debt strategy or numeric scaling rules are adopted. Formula/code fences are source text, not calculated outputs.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S14:L7–L23

## INPUT
Parse the following:
$ARGUMENTS

If data is missing, ask for what you need. Accepted inputs:
- **AOV (first order)**: [REQUIRED] average order value on initial purchase
- **AOV (repeat order)**: (if different from first -- subscriptions, bundles)
- **COGS (fully loaded)**: [REQUIRED] product + packaging + fulfillment + shipping to customer
- **CAC or CPA**: [REQUIRED] cost to acquire a new customer (Shopify new customer = TRUE, not Meta-reported)
- **Ad Spend (monthly)**: current monthly ad budget
- **Processing Fee %**: default 3% (Shopify Payments ~2.8% + $0.30)
- **Subscription Platform Fee %**: default 0.5-1% (Skio/Loop/Seals/Recharge)
- **Agency/Team Variable Fee %**: % of ad spend paid to agencies or team (default 0%)
- **LTV Curve**: month-over-month cohort retention percentages (Month 0-12), or "unknown"
- **Payment Terms**: Meta billing terms, credit card terms, supplier terms
- **Monthly Revenue**: current or projected
- **Monthly OpEx**: fixed overhead (payroll, rent, software)

## Original excerpt — S14:L27–L40

## PHASE 1: CONTRIBUTION MARGIN CALCULATOR

> Source: Evolve Finance Module 1 -- "Contribution Margin is the truth serum."

### Core Formula
```
Contribution Margin ($) = Revenue - Variable Costs
Contribution Margin (%) = (Revenue - Variable Costs) / Revenue
```

**CRITICAL: Contribution Margin is NOT Profit.**
- Profit (Operating Income) = what remains after ALL bills (overhead, payroll, rent, software)
- Contribution Margin = what remains after VARIABLE costs only (costs that scale with revenue)


## Original excerpt — S14:L54–L66

### First Order vs Repeat Order CM (this is huge)

**First Order Contribution Margin:**
```
First Order CM ($) = AOV - (COGS + Processing + Sub Fees + CAC + Agency Fees + Returns)
First Order CM (%) = First Order CM ($) / AOV
```

**Repeat Order Contribution Margin:**
```
Repeat Order CM ($) = AOV_repeat - (COGS_repeat + Processing + Sub Fees + Returns)
Repeat Order CM (%) = Repeat Order CM ($) / AOV_repeat
```

## Original excerpt — S14:L98–L105

### Key Distinctions (stop mixing these)

| Term | Definition | Source |
|------|-----------|--------|
| **CAC** | Total ad spend / net new Shopify customers (new customer = TRUE) | Shopify, NOT Facebook |
| **CPA** | Cost per purchase/event (includes returning customers) | Meta Ads Manager |
| **LTV** | Cumulative dollar value a customer generates over time | Lifetimely or manual cohort |
| **Retention** | % of customers who stay | Different from LTV -- you can have decent retention but low dollars |

## Original excerpt — S14:L109–L111

### Cohort LTV Model

Build month-by-month cumulative view (Month 0-12) tracking: LTV % retention, Revenue per month, Margin per month, Cumulative Revenue, Cumulative Margin.

## Original excerpt — S14:L126–L130

### First vs Repeat Order Split

The model MUST separate:
- **AOV + margin on first order** (includes CAC, agency fees, possible intro discounts)
- **AOV + margin on repeat orders** (no CAC, no spend-tied fees, possibly different product mix)

## Original excerpt — S14:L192–L196

### Stress Test Scenarios
Run these three scenarios against the model:
1. **CAC +20%** -- What if acquisition gets harder?
2. **LTV -20%** -- What if retention drops?
3. **COGS +5%** -- What if costs increase?

## Original excerpt — S14:L255–L260

### Guardrails (rules, not suggestions)
1. Never scale debt faster than your ability to fulfill
2. Stress test: CAC +20%, LTV Month 1-2 -10%, refund rate +2%, payouts delayed 7-14 days
3. Always know your "cash-out date" -- not "month 3 profitability" but the DATE the bill hits
4. Until dialed in, target payback by Month 2 (gives 30 days of wiggle room before Month 3)
5. Do not rely on rewards math unless you have actually calculated it

## Original excerpt — S14:L387–L433

## OUTPUT FORMAT

Deliver the complete financial analysis in this structure:

### FINANCIAL HEALTH REPORT: [Brand/Product Name]
**Date:** [today]

**1. CONTRIBUTION MARGIN**
- First Order CM: $X (X%)
- Repeat Order CM: $X (X%)
- Status: [STRONG / HEALTHY / THIN / BREAKEVEN / NEGATIVE]

**2. LTV MODEL** (if data available)
- Month 0-3 cumulative margin: $X
- Payback month: Month X
- 12-month LTV per customer: $X
- Status: [ELITE / STRONG / GOOD / RISKY / DANGEROUS]

**3. BAROMETER DASHBOARD**

| Metric | Value | Status | Fix Priority |
|--------|-------|--------|-------------|
| AOV | $X | GREEN/YELLOW/RED | |
| COGS % | X% | GREEN/YELLOW/RED | |
| CAC | $X | GREEN/YELLOW/RED | |
| First Order CM % | X% | GREEN/YELLOW/RED | |
| LTV Month 1 Retention | X% | GREEN/YELLOW/RED | |
| 90-Day Payback | $X | GREEN/YELLOW/RED | |

**4. CASH CONVERSION**
- Current float: X days
- Payment stack: [Meta terms + Card terms + Supplier terms]
- Payback vs cash-out: [SAFE / TIGHT / DANGER]

**5. BREAK-EVEN TARGETS**
- Break-Even ROAS: X
- Scaling ROAS: X
- Break-Even CPA: $X
- Scaling CPA: $X

**6. TOP 3 ACTIONS** (prioritized by Barometer framework)
1. [Highest impact fix]
2. [Second priority]
3. [Third priority]

**7. CROSS-COMMAND HANDOFFS**
- [List any triggers that should route to other /evolve- commands]

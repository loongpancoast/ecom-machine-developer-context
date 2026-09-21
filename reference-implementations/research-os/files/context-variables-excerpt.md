# Reusable context variables — historical redacted original excerpt

> Redacted original excerpt, not a new instruction set. Stage codes, exact counts, named framework and immutable-copy rule belong to the old pipeline. Treat product/offer facts as versioned inputs and unsupported mechanism claims as hypotheses; do not fabricate them. Referenced state-manager script is not included or executed.

## 1. The golden handoff variables

These few values appear again and again downstream. Once set, copy them verbatim —
never re-derive or paraphrase them mid-pipeline. Keep a short "Golden Variables"
block at the top of `S0_frame` and update the mechanism ones after S4:

| Variable | Set in | Used by | Format |
|---|---|---|---|
| **ONE-SENTENCE DESIRE** | S0 | every stage (north star) | "People who want ___ because ___" — *no product mention* |
| **PRODUCT SNAPSHOT** | S0 | S1, S4, S5, S7 | name · what it is · who for · price band · landed-cost est · mechanism in one line |
| **AWARENESS LEVEL** | S1/S2 | S4, S6, S7 | Unaware / Problem-Aware / Solution-Aware / Product-Aware |
| **SOPHISTICATION STAGE** | S1 | S4, S6 (headline approach) | [REDACTED: named framework] 1–5 |
| **TOP ⭐⭐⭐ PHRASES** | S2 | S3, S6 (hooks/leads), S7 | the 3–10 highest-% verbatim phrases, each with count + % |
| **AVATAR NAME + 3-TIER PAIN STACK** | S3 | S4, S6, S7 | name · Tier 1 surface · Tier 2 emotional · Tier 3 identity |
| **5 DISTINCT DESIRES** | S3 | S5, S6, S8 | each "I want ___" + who feels it + 3–5 verbatim phrases |
| **UMP** | S4 | S6, S7 (woven into all copy) | "The real reason [symptom] is not [assumed cause] — it is [hidden cause]." |
| **UMS** | S4 | S6, S7 | "Because [product] does [mechanism], it can [result], unlike [alternatives]." |
| **LEAD TYPE** | S4 | S6 | Offer / Promise / Problem-Solution / Big Secret / Proclamation / Story |
| **OFFER + GUARANTEE + PRICE** | S5 | S6 (CTA), S7 | tiers · bundle · guarantee · price anchor |
| **WINNING DESIRE / ANGLE** | S6/S8 | S6 (angle testing), S7, S8 | after a test decides it |

If you have not yet run the stage that sets a variable, do not invent it — run that
stage first. The state manager (`scripts/dossier.py check <stage>`) enforces this.

import { createHash } from 'node:crypto';

const PASS = new Set(['pass', 'waived']);

const BRIEF_POLICIES = {
  'landing-page': {
    title: 'Evidence-backed landing-page builder brief',
    gates: ['P4', 'P5', 'P6', 'P7', 'P8'],
    assignee: 'CRO copywriter, page designer, or landing-page builder agent',
    deliverables: [
      'message map and section-by-section original copy',
      'desktop and mobile editable design source',
      'private staging implementation with source files',
      'claim-to-evidence map and asset-rights manifest',
      'responsive, accessibility, performance, link, form, and analytics QA report',
    ],
  },
  'video-editor': {
    title: 'Evidence-backed video editor brief',
    gates: ['P5', 'P6', 'P8'],
    assignee: 'video editor, UGC producer, or admitted AI-video adapter',
    deliverables: [
      'original timed script and shot graph',
      'storyboard or low-cost animatic before final edit',
      'clean, captioned, and platform-sized masters',
      'editable project/source files and licensed music record',
      'prompt, model, render-job, rights, claim, and QA manifest',
    ],
  },
  'shopify-builder': {
    title: 'Evidence-backed Shopify builder brief',
    gates: ['P4', 'P7', 'P8', 'P10'],
    assignee: 'Shopify developer, theme agent, or admitted Shopify adapter',
    deliverables: [
      'Git-backed unpublished theme or private page/template',
      'product, variant, SKU, pricing, inventory, and fulfillment mapping',
      'mobile/desktop preview and Theme Check output',
      'test checkout, policy, tax, shipping, pixel, consent, and event QA',
      'exact publish manifest and rollback target',
    ],
  },
};

function md(value) {
  return String(value ?? 'Unavailable').replaceAll('|', '\\|').replaceAll('\n', ' ');
}

function linkFor(item) {
  if (item?.source_url) return `[source](${item.source_url})`;
  if (item?.artifact_path) return `\`${md(item.artifact_path)}\``;
  return 'Unavailable';
}

function stableHash(value) {
  return createHash('sha256').update(JSON.stringify(value)).digest('hex');
}

function stageStatus(snapshot, id) {
  return snapshot.stages?.find((stage) => stage.id === id)?.status ?? 'missing';
}

function gateRows(snapshot, gates) {
  return gates.map((id) => ({ id, status: stageStatus(snapshot, id) }));
}

function blockersFor(snapshot, gates) {
  return gates
    .map((id) => snapshot.stages?.find((stage) => stage.id === id) ?? { id, status: 'missing' })
    .filter((stage) => !PASS.has(stage.status))
    .map((stage) => ({
      id: stage.id,
      status: stage.status,
      blocker: stage.blocker ?? 'Required gate has not passed.',
      next_action: stage.next_action ?? 'Complete and review the gate before production.',
    }));
}

function evidenceTable(snapshot) {
  const rows = (snapshot.evidence ?? []).slice(0, 30);
  if (!rows.length) return 'No evidence records supplied.';
  return [
    '| Evidence ID | Level | Source type | Source/artifact | Synopsis | Limitation |',
    '|---|---|---|---|---|---|',
    ...rows.map((item) => `| ${md(item.id)} | ${md(item.evidence_level)} | ${md(item.source_type)} | ${linkFor(item)} | ${md(item.excerpt_or_synopsis)} | ${md(item.limitations ?? 'None recorded')} |`),
  ].join('\n');
}

function metricTable(snapshot) {
  const rows = (snapshot.metrics ?? []).filter((metric) =>
    ['price', 'revenue', 'attributed_revenue', 'units_sold', 'rating', 'review_count', 'landed_unit_cost', 'cpa', 'roas', 'cvr', 'aov'].includes(metric.metric_name),
  );
  if (!rows.length) return 'No decision-relevant metrics supplied.';
  return [
    '| Metric ID | Object scope | Metric | Value | Period | Source class | Evidence | Limitation |',
    '|---|---|---|---:|---|---|---|---|',
    ...rows.slice(0, 30).map((metric) => {
      const value = metric.value == null ? 'Unavailable' : `${metric.currency ? `${metric.currency} ` : ''}${metric.value}${metric.unit ? ` ${metric.unit}` : ''}`;
      return `| ${md(metric.id)} | ${md(`${metric.object_type}:${metric.object_id}`)} | ${md(metric.metric_name)} | ${md(value)} | ${md(metric.period_label)} | ${md(metric.source_class)} | ${md(metric.evidence_id)} | ${md(metric.limitations ?? 'None recorded')} |`;
    }),
  ].join('\n');
}

function adReferenceTable(snapshot) {
  const rows = snapshot.ads ?? [];
  if (!rows.length) return 'No direct ad references supplied.';
  return [
    '| Ad ID | Platform | Direct reference | Ranking basis | Conversion proven? | Permitted use |',
    '|---|---|---|---|---|---|',
    ...rows.slice(0, 20).map((ad) => `| ${md(ad.id)} | ${md(ad.platform)} | [open](${ad.direct_url}) | ${md(ad.ranking_basis)} | ${ad.conversion_proven === true ? 'Yes' : 'No'} | Structural analysis only; do not copy expression, branding, footage, testimonials, or claims. |`),
  ].join('\n');
}

function supplierTable(snapshot) {
  const rows = snapshot.suppliers ?? [];
  if (!rows.length) return 'No supplier candidates supplied.';
  return [
    '| Supplier ID | Candidate | Direct URL | Quote / landed cost | Sample / QC | Selected? |',
    '|---|---|---|---|---|---|',
    ...rows.map((supplier) => {
      const quote = supplier.landed_unit_cost == null
        ? `${supplier.currency ?? ''} ${supplier.unit_cost ?? 'Unavailable'} product-only; landed cost unavailable`
        : `${supplier.currency ?? ''} ${supplier.landed_unit_cost} landed`;
      return `| ${md(supplier.id)} | ${md(supplier.name)} | [open](${supplier.direct_url}) | ${md(quote)} | ${md(`${supplier.sample_status ?? 'unknown'} / ${supplier.qc_status ?? 'unknown'}`)} | ${supplier.selected === true ? 'Yes' : 'No'} |`;
    }),
  ].join('\n');
}

function groundedAngles(snapshot) {
  return (snapshot.angles ?? []).filter((angle) => ['grounded', 'tested', 'winner'].includes(angle.status));
}

function supportedClaims(snapshot) {
  return (snapshot.claims ?? []).filter((claim) => claim.review_status === 'supported');
}

function angleTable(snapshot) {
  const rows = groundedAngles(snapshot);
  if (!rows.length) return 'No grounded angles. Do not invent an angle from model memory or SEO copy.';
  return [
    '| Angle ID | Audience | Pain/desire | Promise | Mechanism | Proof plan |',
    '|---|---|---|---|---|---|',
    ...rows.map((angle) => `| ${md(angle.id)} | ${md(angle.audience)} | ${md(angle.pain_or_desire)} | ${md(angle.promise)} | ${md(angle.mechanism)} | ${md(angle.proof_plan)} |`),
  ].join('\n');
}

function claimTable(snapshot) {
  const rows = supportedClaims(snapshot);
  if (!rows.length) return 'No claims are approved. Use only plainly observable, non-comparative product facts after supplier/QC confirmation.';
  return [
    '| Claim ID | Approved wording | Type | Allowed channels | Limitation |',
    '|---|---|---|---|---|',
    ...rows.map((claim) => `| ${md(claim.id)} | ${md(claim.text)} | ${md(claim.claim_type)} | ${md((claim.allowed_channels ?? []).join(', '))} | ${md(claim.limitations ?? 'None recorded')} |`),
  ].join('\n');
}

function vocTable(snapshot) {
  const rows = snapshot.voc_quotes ?? [];
  if (!rows.length) return 'No source-linked VOC corpus. Do not substitute SEO articles, generic persona copy, or synthetic quotes.';
  return [
    '| VOC ID | Source | Direct URL | Excerpt | Pain/desire |',
    '|---|---|---|---|---|',
    ...rows.slice(0, 25).map((quote) => `| ${md(quote.id)} | ${md(quote.source_type)} | [open](${quote.source_url}) | ${md(quote.excerpt)} | ${md(quote.pain_desire)} |`),
  ].join('\n');
}

function sharedSections(snapshot, policy, status, blockers) {
  const run = snapshot.run ?? {};
  const product = snapshot.products?.[0] ?? {};
  const generatedAt = new Date().toISOString();
  const lines = [
    `# ${policy.title}`,
    '',
    `**Build status:** ${status}`,
    '',
    `**Brief hash:** \`${stableHash({ type: policy.title, snapshot })}\``,
    '',
    `**Generated:** ${generatedAt}`,
    '',
    '> This brief is compiled from the supplied evidence snapshot. It is not evidence and cannot cure a failed gate. Machine and delegated routes must return the same artifacts and pass the same acceptance tests.',
    '',
    '## Outcome and scope',
    '',
    `- Product: ${md(product.name)} (ID: \`${md(product.id)}\`)`,
    `- Concept: ${md(product.concept)}`,
    `- Market: ${md(run.market)}`,
    `- Channel: ${md(run.channel)}`,
    `- Current decision: ${md(product.decision)} at ${md(product.evidence_level)} evidence level; score ${md(product.score_100)}/100`,
    `- Default environment: private staging/preview; production publication is out of scope without a separate approval envelope`,
    `- Assignee type: ${policy.assignee}`,
    '',
    '### Required deliverables',
    '',
    ...policy.deliverables.map((item) => `- ${item}`),
    '',
    '## Gate check',
    '',
    '| Gate | Status |',
    '|---|---|',
    ...gateRows(snapshot, policy.gates).map((row) => `| ${row.id} | ${md(row.status)} |`),
    '',
  ];
  if (blockers.length) {
    lines.push(
      '### Blocking conditions',
      '',
      '| Gate | Status | Blocker | Required next action |',
      '|---|---|---|---|',
      ...blockers.map((blocker) => `| ${blocker.id} | ${md(blocker.status)} | ${md(blocker.blocker)} | ${md(blocker.next_action)} |`),
      '',
      '**Stop rule:** this file may be used to assign research or prepare a skeleton, but it may not be treated as approved production copy, a completed build, or a launchable asset.',
      '',
    );
  }
  return lines;
}

function landingSections(snapshot) {
  return [
    '## Evidence manifest', '', evidenceTable(snapshot), '',
    '## Decision-relevant metrics', '', metricTable(snapshot), '',
    'All revenue and attributed-sales values retain their source class. Platform estimates are not merchant proof, and active-ad counts are not conversion proof.', '',
    '## Voice of customer', '', vocTable(snapshot), '',
    '## Grounded angles', '', angleTable(snapshot), '',
    '## Allowed claims', '', claimTable(snapshot), '',
    '## Competitor and winning-format references', '', adReferenceTable(snapshot), '',
    'Use these references only to diagnose format, hook category, pacing, objections, message order, and offer presentation. Write original expression and use rights-cleared assets.', '',
    '## Supplier and product-truth inputs', '', supplierTable(snapshot), '',
    '## Page contract', '',
    '1. Above the fold: identify the product, supported outcome, avatar, offer, primary CTA, and material fulfillment term without unsupported urgency or social proof.',
    '2. Problem and mechanism: use only supported claims and grounded VOC; label unresolved mechanism language as a hypothesis and keep it out of production.',
    '3. Demonstration: show the exact selected sample/SKU. Generated imagery must not alter material features, included components, dimensions, controls, or results.',
    '4. Proof: use only approved reviews, test data, certifications, guarantees, shipping terms, and policies. Never generate testimonials or placeholder statistics that can be mistaken for real proof.',
    '5. Objections and FAQ: each answer must link to product truth, policy, supplier/QC, or accepted VOC evidence.',
    '6. Offer: price, compare-at price, bundles, gifts, guarantee, tax, shipping, and return terms must match the approved economics and live commerce objects.',
    '7. Accessibility and performance: semantic headings, keyboard access, visible focus, alt text, readable contrast, responsive behavior, stable layout, optimized assets, and measured performance.',
    '8. Analytics: implement the approved event dictionary in staging and verify test events, consent behavior, and browser/server deduplication before publication.',
    '',
    '## Machine route', '',
    'Resolve an admitted page/site/Shopify adapter at runtime. Build in a branch, unpublished theme, or private preview; capture exact operations, input/output hashes, object IDs, preview URL, read-back verification, QA, and rollback target.', '',
    '## Delegated route', '',
    'Create an internal work item with this brief and project-scoped asset links. Do not post a public job, contact a contractor, grant credentials, hire, pay, or approve an overage without a separate approval. Require editable source and a structured return manifest.', '',
  ];
}

function videoSections(snapshot) {
  return [
    '## Evidence and angle inputs', '', evidenceTable(snapshot), '', angleTable(snapshot), '', claimTable(snapshot), '',
    '## Structural references', '', adReferenceTable(snapshot), '',
    '## Production contract', '',
    '- Build an original script, timed shot list, supers, voiceover, sound, CTA, and platform export matrix.',
    '- Each claim-bearing line or visual needs a claim ID; each concept needs grounded angle and VOC IDs.',
    '- Competitor footage/transcripts are analysis references, not source media or script licenses.',
    '- A Seedance-style or other vendor-specific prompt pack is a specification until a real render receipt exists.',
    '- AI renders must record model/version, job ID, prompt hash, references, moderation result, cost, output hash, continuity QA, and rights limitations.',
    '- Human delivery must include raw footage, releases, project file, clean master, captioned master, SRT, music license, and revision log.',
    '',
  ];
}

function shopifySections(snapshot) {
  return [
    '## Product truth and economics', '', supplierTable(snapshot), '', metricTable(snapshot), '', claimTable(snapshot), '',
    '## Store build contract', '',
    '- Work only in a Git branch and unpublished/development theme or private page/template.',
    '- Map exact product, variant, SKU, price, compare-at rationale, inventory policy, fulfillment promise, bundle, discount, tax, shipping, guarantee, and return rules.',
    '- Run Theme Check plus mobile/desktop, links, forms, accessibility, performance, checkout, order-confirmation, refund/cancel, pixel/CAPI, consent, and event tests.',
    '- Never transmit banking or card credentials in a brief or task. Owner identity, billing, payout, gateway activation, domain transfer, and live plan selection stay human-controlled.',
    '- Return theme/page/product IDs, source commit, preview URL, QA report, exact publish payload hash, last known-good version, and rollback procedure.',
    '',
  ];
}

export function compileBrief(snapshot, type) {
  const policy = BRIEF_POLICIES[type];
  if (!policy) throw new Error(`Unknown brief type: ${type}. Expected ${Object.keys(BRIEF_POLICIES).join(', ')}`);
  const blockers = blockersFor(snapshot, policy.gates);
  const status = blockers.length ? 'BLOCKED — RESEARCH/HANDOFF SKELETON ONLY' : 'READY FOR PRIVATE DRAFT BUILD';
  const lines = sharedSections(snapshot, policy, status, blockers);
  if (type === 'landing-page') lines.push(...landingSections(snapshot));
  if (type === 'video-editor') lines.push(...videoSections(snapshot));
  if (type === 'shopify-builder') lines.push(...shopifySections(snapshot));
  lines.push(
    '## Acceptance and return manifest', '',
    '- Deliverable IDs, versions, producer, creation tools, source URLs/paths, content hashes, environment, and public/draft status.',
    '- Evidence, angle, claim, offer, SKU, and destination mappings.',
    '- Exact deviations, unresolved blockers, rights status, QA results, and rollback target.',
    '- No secret values, private tokens, card/bank data, or unredacted customer data.',
    '',
    `**Final disposition:** ${status}.`,
    '',
  );
  return lines.join('\n');
}

export function briefTypes() {
  return Object.keys(BRIEF_POLICIES);
}

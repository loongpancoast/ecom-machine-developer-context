-- Product Research OS reference schema (PostgreSQL / Supabase)
-- Airtable uses the same table/field names where practical.

create extension if not exists pgcrypto;

create table if not exists research_runs (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  market text not null,
  channel text not null,
  budget numeric(14,2),
  currency char(3),
  risk_tolerance text,
  operator_stage text,
  routes text[] not null default '{}',
  status text not null default 'in_progress' check (status in ('in_progress','blocked','complete','killed')),
  decision text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  name text not null,
  concept text not null,
  niche text,
  stage_id text not null default 'P0',
  score_100 numeric(5,2) check (score_100 between 0 and 100),
  decision text check (decision in ('hunt','test','conditional_test','kill','launch','scale','hold')),
  evidence_level text not null default 'hypothesis' check (evidence_level in ('hypothesis','signal','proof','operator_validation')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists source_records (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  product_id uuid references products(id) on delete cascade,
  source_type text not null,
  object_type text not null,
  object_external_id text,
  source_url text,
  artifact_path text,
  collector_tool text not null,
  captured_at timestamptz not null,
  observed_period_start timestamptz,
  observed_period_end timestamptz,
  raw_payload_hash text,
  license_or_rights_status text,
  limitations text,
  conflict_group text,
  unique (run_id, source_type, object_type, object_external_id, captured_at),
  check (source_url is not null or artifact_path is not null)
);

create table if not exists evidence_items (
  id uuid primary key default gen_random_uuid(),
  source_record_id uuid not null references source_records(id) on delete cascade,
  evidence_level text not null check (evidence_level in ('hypothesis','signal','proof','operator_validation')),
  claim_type text,
  excerpt_or_synopsis text not null,
  content_hash text,
  is_direct_observation boolean not null default false,
  reviewer_status text not null default 'unreviewed' check (reviewer_status in ('unreviewed','accepted','rejected','conflicted')),
  limitations text,
  created_at timestamptz not null default now()
);

create table if not exists metrics (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  product_id uuid references products(id) on delete cascade,
  source_record_id uuid references source_records(id) on delete restrict,
  object_type text not null check (object_type in ('ad','page','product','store','platform','supplier','run')),
  object_id text not null,
  metric_name text not null,
  value numeric,
  unit text,
  currency char(3),
  period_start timestamptz,
  period_end timestamptz,
  period_label text,
  source_class text not null check (source_class in ('platform_estimate','merchant_reported','authorized_first_party','calculated_proxy','direct_observation','unavailable')),
  authorized_account_ref text,
  calculation text,
  limitations text,
  conflict_group text,
  created_at timestamptz not null default now(),
  check ((source_class = 'unavailable' and value is null) or source_class <> 'unavailable'),
  check (metric_name not ilike '%revenue%' or source_class in ('platform_estimate','merchant_reported','authorized_first_party','calculated_proxy','unavailable'))
);

create table if not exists competitors (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  name text not null,
  domain text,
  direct_url text,
  relationship text not null default 'direct',
  observed_at timestamptz,
  unique(product_id, name)
);

create table if not exists ads (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  competitor_id uuid references competitors(id) on delete set null,
  source_record_id uuid not null references source_records(id) on delete restrict,
  platform text not null check (platform in ('meta','tiktok','youtube','other')),
  platform_ad_id text,
  account_name text,
  direct_url text not null,
  observed_at timestamptz not null,
  observed_status text not null check (observed_status in ('active','inactive','unknown')),
  media_type text check (media_type in ('video','image','carousel','dco','unknown')),
  started_at timestamptz,
  last_seen_at timestamptz,
  ranking_basis text not null check (ranking_basis in ('first_party_conversion','platform_attributed_estimate','longevity_proxy','variant_proxy','engagement_proxy','operator_selected','unranked')),
  conversion_proven boolean not null default false,
  transcript_evidence_id uuid references evidence_items(id) on delete set null,
  creative_asset_evidence_id uuid references evidence_items(id) on delete set null,
  limitations text,
  unique(platform, platform_ad_id, observed_at),
  check (not conversion_proven or ranking_basis = 'first_party_conversion')
);

create table if not exists suppliers (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  name text not null,
  direct_url text not null,
  platform text,
  selected boolean not null default false,
  backup boolean not null default false,
  sample_status text not null default 'not_ordered' check (sample_status in ('not_ordered','ordered','received','passed','failed')),
  qc_status text not null default 'not_tested' check (qc_status in ('not_tested','passed','failed','conditional')),
  capacity_status text not null default 'unknown' check (capacity_status in ('unknown','verified','failed')),
  limitations text,
  unique(product_id, direct_url)
);

create table if not exists supplier_quotes (
  id uuid primary key default gen_random_uuid(),
  supplier_id uuid not null references suppliers(id) on delete cascade,
  source_record_id uuid not null references source_records(id) on delete restrict,
  quote_date date not null,
  moq integer,
  unit_cost numeric(14,4) not null,
  currency char(3) not null,
  shipping_cost numeric(14,2),
  shipping_method text,
  destination_country char(2),
  lead_time_days integer,
  duty_rate numeric(8,5),
  fees numeric(14,2),
  landed_unit_cost numeric(14,4),
  calculation text,
  expires_at date
);

create table if not exists voc_quotes (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  source_record_id uuid not null references source_records(id) on delete restrict,
  source_type text not null check (source_type in ('reddit','forum','marketplace_review','trustpilot','tiktok_comment','youtube_comment','first_party_support','survey','interview')),
  source_url text not null,
  published_at timestamptz,
  captured_at timestamptz not null,
  author_alias_hash text,
  excerpt text not null,
  content_hash text not null,
  sentiment text,
  pain_desire text,
  solution_tried text,
  check (char_length(excerpt) <= 500)
);

create table if not exists angles (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  name text not null,
  audience text not null,
  pain_or_desire text not null,
  promise text not null,
  mechanism text,
  proof_plan text not null,
  risk_note text,
  status text not null default 'draft' check (status in ('draft','grounded','rejected','tested','winner','loser')),
  created_at timestamptz not null default now(),
  unique(product_id, name)
);

create table if not exists angle_voc_links (
  angle_id uuid not null references angles(id) on delete cascade,
  voc_quote_id uuid not null references voc_quotes(id) on delete cascade,
  primary key(angle_id, voc_quote_id)
);

create table if not exists angle_evidence_links (
  angle_id uuid not null references angles(id) on delete cascade,
  evidence_item_id uuid not null references evidence_items(id) on delete cascade,
  relationship text not null check (relationship in ('ad_signal','transcript_signal','mechanism_proof','claim_support','risk')),
  primary key(angle_id, evidence_item_id, relationship)
);

create table if not exists claims (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  text text not null,
  claim_type text not null check (claim_type in ('quantitative','comparative','health','safety','certification','testimonial','scarcity','performance','descriptive')),
  review_status text not null default 'unreviewed' check (review_status in ('unreviewed','supported','unsupported','needs_legal','rejected')),
  allowed_channels text[] not null default '{}',
  limitations text
);

create table if not exists claim_evidence_links (
  claim_id uuid not null references claims(id) on delete cascade,
  evidence_item_id uuid not null references evidence_items(id) on delete restrict,
  primary key(claim_id, evidence_item_id)
);

create table if not exists stage_gates (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  product_id uuid references products(id) on delete cascade,
  stage_id text not null,
  required_field text not null,
  status text not null check (status in ('not_started','in_progress','blocked','pass','fail','waived','not_applicable','approved','verified','active','requestable','satisfied')),
  blocker text,
  waiver_id uuid,
  reviewed_at timestamptz,
  unique(run_id, product_id, stage_id, required_field)
);

create table if not exists gate_evidence_links (
  gate_id uuid not null references stage_gates(id) on delete cascade,
  evidence_item_id uuid not null references evidence_items(id) on delete restrict,
  primary key(gate_id, evidence_item_id)
);

create table if not exists approvals (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  product_id uuid references products(id) on delete cascade,
  action_type text not null,
  scope text not null,
  environment text not null default 'preview' check (environment in ('preview','staging','production')),
  target_objects jsonb not null default '{}'::jsonb,
  proposed_payload_hash text,
  budget_cap numeric(14,2),
  currency char(3),
  schedule jsonb,
  included_actions text[] not null default '{}',
  excluded_actions text[] not null default '{}',
  rollback_plan jsonb,
  status text not null check (status in ('draft','requested','approved','rejected','expired','revoked','consumed','invalidated')),
  approver text,
  reason text,
  expires_at timestamptz,
  created_at timestamptz not null default now(),
  resolved_at timestamptz
);

create table if not exists tool_calls (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  connector text not null,
  tool text not null,
  arguments_hash text not null,
  result_hash text,
  started_at timestamptz,
  ended_at timestamptz,
  status text not null check (status in ('executed','failed','timeout','blocked','semantic_error','cancelled')),
  retry_count integer not null default 0,
  result_count integer,
  credits_used numeric,
  cost numeric(14,6),
  error_code text,
  error_message text,
  limitations text
);

create table if not exists tool_call_evidence_links (
  tool_call_id uuid not null references tool_calls(id) on delete cascade,
  evidence_item_id uuid not null references evidence_items(id) on delete restrict,
  primary key(tool_call_id, evidence_item_id)
);

create table if not exists endpoint_coverage (
  run_id uuid not null references research_runs(id) on delete cascade,
  tool text not null,
  status text not null check (status in ('executed','failed','blocked','not_applicable','approval_required')),
  reason text not null,
  call_id uuid references tool_calls(id) on delete set null,
  primary key(run_id, tool)
);

create table if not exists resource_usage (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  resource_type text not null,
  quantity numeric,
  unit text,
  cost numeric(14,6),
  currency char(3),
  source text,
  observed_at timestamptz not null,
  limitations text
);

create table if not exists work_items (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  product_id uuid references products(id) on delete cascade,
  gate_id uuid references stage_gates(id) on delete set null,
  title text not null,
  status text not null default 'backlog',
  work_system text not null,
  external_id text,
  assignee_type text,
  acceptance_criteria text not null,
  approved_sources text[],
  forbidden_substitutes text[],
  budget_cap numeric(14,2),
  due_at timestamptz,
  approval_required boolean not null default false
);

-- Provider-neutral orchestration. Connector names and credentials belong in
-- adapter configuration, while the workflow graph depends on capability ids.
create table if not exists capability_adapters (
  id text primary key,
  capability_id text not null,
  provider text not null,
  integration_form text not null check (integration_form in ('mcp','api','sdk','cli','workflow','browser','local','human')),
  status text not null check (status in ('proposed','contract_testing','admitted','degraded','blocked','retired')),
  action_class text not null check (action_class in ('read','generate','draft','live_write','spend','physical','legal')),
  environment text not null default 'staging',
  exact_operations text[] not null default '{}',
  auth_scopes text[] not null default '{}',
  schema_hash text,
  contract_version text,
  last_probed_at timestamptz,
  supports_idempotency boolean not null default false,
  supports_read_back boolean not null default false,
  supports_rollback boolean not null default false,
  approval_tier text not null default 'operator',
  configuration jsonb not null default '{}'::jsonb,
  limitations text
);

create table if not exists workflow_instances (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  graph_version text not null,
  graph_hash text not null,
  registry_version text not null,
  registry_hash text not null,
  policy_version text not null,
  policy_hash text not null,
  runtime_profile text not null,
  profile_hash text not null,
  source_snapshot_hash text not null,
  execution_host text not null,
  environment text not null default 'preview' check (environment in ('preview','staging','production')),
  status text not null default 'running' check (status in ('planned','running','waiting_human','blocked','complete','failed','cancelled','rolled_back')),
  state_version bigint not null default 1,
  started_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  completed_at timestamptz
);

create table if not exists workflow_steps (
  id uuid primary key default gen_random_uuid(),
  workflow_id uuid not null references workflow_instances(id) on delete cascade,
  node_id text not null,
  stage_id text not null,
  capability_id text not null,
  adapter_id text references capability_adapters(id) on delete set null,
  selected_route text not null check (selected_route in ('machine','delegate','waiting_human','blocked','skip')),
  fallback_route text check (fallback_route in ('machine','delegate','waiting_human','blocked','skip')),
  status text not null check (status in ('pending','ready','ready_to_prepare','running','awaiting_approval','delegated','waiting_human','blocked','succeeded','failed','skipped','rolled_back','cancelled')),
  reason text,
  target_objects jsonb not null default '{}'::jsonb,
  input_hash text,
  output_hash text,
  idempotency_key text not null,
  attempt_count integer not null default 0,
  max_attempts integer not null default 3,
  approval_id uuid references approvals(id) on delete set null,
  work_item_id uuid references work_items(id) on delete set null,
  next_retry_at timestamptz,
  started_at timestamptz,
  completed_at timestamptz,
  unique(workflow_id, node_id),
  unique(idempotency_key)
);

create table if not exists workflow_events (
  id bigserial primary key,
  workflow_id uuid not null references workflow_instances(id) on delete cascade,
  step_id uuid references workflow_steps(id) on delete set null,
  event_type text not null,
  state_version bigint not null,
  payload jsonb not null default '{}'::jsonb,
  actor_type text not null check (actor_type in ('system','agent','connector','operator','contractor','webhook')),
  actor_id text,
  occurred_at timestamptz not null default now(),
  unique(workflow_id, state_version)
);

create table if not exists build_artifacts (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  workflow_step_id uuid references workflow_steps(id) on delete set null,
  artifact_type text not null,
  version text not null,
  environment text not null check (environment in ('preview','staging','production')),
  public_status text not null default 'private' check (public_status in ('private','shared_preview','published','retired')),
  source_url text,
  artifact_path text,
  content_hash text not null,
  producer text not null,
  creation_tool text,
  rights_status text,
  evidence_ids uuid[] not null default '{}',
  claim_ids uuid[] not null default '{}',
  angle_ids uuid[] not null default '{}',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  check (source_url is not null or artifact_path is not null)
);

create table if not exists execution_receipts (
  id uuid primary key default gen_random_uuid(),
  workflow_step_id uuid not null references workflow_steps(id) on delete cascade,
  tool_call_id uuid references tool_calls(id) on delete set null,
  adapter_id text references capability_adapters(id) on delete set null,
  exact_operation text not null,
  arguments_hash text not null,
  result_hash text,
  target_objects jsonb not null default '{}'::jsonb,
  returned_objects jsonb not null default '{}'::jsonb,
  read_back_status text not null check (read_back_status in ('not_required','pending','verified','mismatch','failed')),
  approval_id uuid references approvals(id) on delete set null,
  elapsed_ms integer,
  resource_usage jsonb not null default '{}'::jsonb,
  limitations text,
  created_at timestamptz not null default now()
);

create table if not exists qa_reports (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references research_runs(id) on delete cascade,
  workflow_step_id uuid references workflow_steps(id) on delete set null,
  artifact_id uuid references build_artifacts(id) on delete set null,
  suite_version text not null,
  environment text not null check (environment in ('preview','staging','production')),
  disposition text not null check (disposition in ('pass','conditional','fail','blocked')),
  checks jsonb not null,
  defects jsonb not null default '[]'::jsonb,
  reviewer text,
  reviewed_at timestamptz not null default now()
);

create table if not exists delegations (
  id uuid primary key default gen_random_uuid(),
  workflow_step_id uuid not null references workflow_steps(id) on delete cascade,
  work_item_id uuid references work_items(id) on delete set null,
  assignee_type text not null,
  assignee_id text,
  brief_artifact_id uuid references build_artifacts(id) on delete restrict,
  return_manifest jsonb,
  contact_status text not null default 'internal_draft' check (contact_status in ('internal_draft','approved_to_contact','contacted','accepted','declined','delivered','cancelled')),
  hiring_approval_id uuid references approvals(id) on delete set null,
  due_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists rollback_receipts (
  id uuid primary key default gen_random_uuid(),
  workflow_step_id uuid not null references workflow_steps(id) on delete cascade,
  approval_id uuid references approvals(id) on delete set null,
  reason text not null,
  before_state jsonb not null,
  after_state jsonb not null,
  reversal_operations jsonb not null,
  data_or_customer_impact text,
  verified boolean not null default false,
  created_at timestamptz not null default now()
);

create index if not exists idx_source_records_product on source_records(product_id, captured_at desc);
create index if not exists idx_metrics_object on metrics(object_type, object_id, metric_name, period_end desc);
create index if not exists idx_ads_product on ads(product_id, platform, observed_at desc);
create index if not exists idx_voc_product on voc_quotes(product_id, source_type);
create index if not exists idx_gates_product on stage_gates(product_id, stage_id, status);
create index if not exists idx_calls_run on tool_calls(run_id, tool, status);
create index if not exists idx_capability_adapters_lookup on capability_adapters(capability_id, status, action_class);
create index if not exists idx_workflow_steps_ready on workflow_steps(workflow_id, status, stage_id);
create index if not exists idx_workflow_events_history on workflow_events(workflow_id, state_version);
create index if not exists idx_build_artifacts_run on build_artifacts(run_id, artifact_type, created_at desc);

create or replace view angle_grounding_status as
select
  a.id as angle_id,
  count(distinct av.voc_quote_id) as voc_quote_count,
  count(distinct v.source_url) as unique_voc_urls,
  count(distinct case when ae.relationship in ('ad_signal','transcript_signal') then ae.evidence_item_id end) as ad_or_transcript_signals,
  (
    count(distinct av.voc_quote_id) >= 3
    and count(distinct v.source_url) >= 2
    and count(distinct case when ae.relationship in ('ad_signal','transcript_signal') then ae.evidence_item_id end) >= 1
  ) as grounded
from angles a
left join angle_voc_links av on av.angle_id = a.id
left join voc_quotes v on v.id = av.voc_quote_id
left join angle_evidence_links ae on ae.angle_id = a.id
group by a.id;

create or replace view supplier_selection_status as
select
  p.id as product_id,
  count(distinct q.id) as quote_count,
  bool_or(s.selected) as has_selected_supplier,
  bool_or(s.backup) as has_backup_supplier,
  bool_or(s.selected and s.sample_status = 'passed' and s.qc_status = 'passed' and s.capacity_status = 'verified') as selected_supplier_ready,
  count(distinct case when q.landed_unit_cost is not null then q.id end) as landed_cost_quotes
from products p
left join suppliers s on s.product_id = p.id
left join supplier_quotes q on q.supplier_id = s.id
group by p.id;

create or replace view ad_conversion_truth as
select
  a.id as ad_id,
  a.ranking_basis,
  a.conversion_proven,
  count(m.id) filter (
    where m.source_class = 'authorized_first_party'
      and m.metric_name in ('purchases','cpa','roas')
      and m.object_type = 'ad'
  ) as first_party_conversion_metrics,
  (
    a.conversion_proven
    and a.ranking_basis = 'first_party_conversion'
    and count(m.id) filter (
      where m.source_class = 'authorized_first_party'
        and m.metric_name in ('purchases','cpa','roas')
        and m.object_type = 'ad'
    ) > 0
  ) as conversion_claim_supported
from ads a
left join metrics m on m.object_id = a.id::text
group by a.id;

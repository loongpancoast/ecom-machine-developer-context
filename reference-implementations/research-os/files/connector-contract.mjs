import { sha256 } from '../engine.mjs';

const FORMS = new Set(['mcp', 'api', 'sdk', 'cli', 'workflow', 'browser', 'human']);
const ACTIONS = new Set(['read', 'generate', 'draft', 'live_write', 'spend', 'publish', 'send', 'payment', 'supplier_order', 'security', 'destructive', 'hire', 'physical', 'legal']);
const REQUIRED_TESTS = [
  'happy_path', 'empty_result', 'revoked_auth', 'partial_success',
  'schema_drift', 'rate_limit', 'timeout', 'duplicate_delivery',
];
const SECRET_KEYS = /(^|_)(api_?key|access_?token|refresh_?token|authorization|password|client_?secret|private_?key|cookie)s?$/i;

function array(value) {
  return Array.isArray(value) ? value : [];
}

function walkSecrets(value, path = '$', findings = []) {
  if (!value || typeof value !== 'object') return findings;
  for (const [key, child] of Object.entries(value)) {
    const childPath = `${path}.${key}`;
    if (SECRET_KEYS.test(key) && !key.endsWith('_env') && child != null && child !== '') findings.push(childPath);
    if (typeof child === 'object') walkSecrets(child, childPath, findings);
  }
  return findings;
}

export function validateAdapterManifest(manifest) {
  const errors = [];
  const warnings = [];
  for (const field of ['id', 'provider', 'official_source_url', 'integration_form', 'owner', 'version']) {
    if (!manifest?.[field]) errors.push(`Missing ${field}.`);
  }
  if (!FORMS.has(manifest?.integration_form)) errors.push(`Unsupported integration_form: ${manifest?.integration_form}`);
  if (!/^https:\/\//.test(manifest?.official_source_url ?? '')) errors.push('official_source_url must be HTTPS.');
  if (!array(manifest?.capability_ids).length) errors.push('At least one capability_id is required.');
  if (!array(manifest?.operations).length) errors.push('At least one exact operation is required.');

  for (const operation of array(manifest?.operations)) {
    if (!operation.id) errors.push('Operation missing id.');
    if (!ACTIONS.has(operation.action_class)) errors.push(`Operation ${operation.id ?? '?'} has unsupported action_class.`);
    if (operation.action_class !== 'read' && !array(operation.side_effects).length) warnings.push(`Operation ${operation.id ?? '?'} should enumerate side effects.`);
    if (['live_write', 'spend', 'publish', 'send', 'payment', 'supplier_order'].includes(operation.action_class)) {
      if (operation.read_back !== true) errors.push(`Consequential operation ${operation.id} must support read-back.`);
      if (!operation.compensating_action) errors.push(`Consequential operation ${operation.id} needs a compensating_action.`);
      if (!operation.approval_class) errors.push(`Consequential operation ${operation.id} needs an approval_class.`);
    }
  }

  const testMap = new Map(array(manifest?.contract_tests).map((test) => [test.name, test.status]));
  for (const name of REQUIRED_TESTS) {
    if (!testMap.has(name)) errors.push(`Missing contract test: ${name}.`);
  }
  if (manifest?.admission_status === 'admitted') {
    for (const name of REQUIRED_TESTS) if (testMap.get(name) !== 'pass') errors.push(`Admitted adapter requires ${name}=pass.`);
    if (!manifest.schema_hash) errors.push('Admitted adapter requires schema_hash.');
    if (!manifest.last_probed_at) errors.push('Admitted adapter requires last_probed_at.');
  }
  for (const path of walkSecrets(manifest)) errors.push(`Secret value must not be stored at ${path}; reference a runtime secret name instead.`);

  return { valid: errors.length === 0, errors, warnings };
}

function redact(value) {
  if (Array.isArray(value)) return value.map(redact);
  if (!value || typeof value !== 'object') return value;
  return Object.fromEntries(Object.entries(value).map(([key, child]) => [
    key,
    SECRET_KEYS.test(key) && !key.endsWith('_env') ? '[REDACTED]' : redact(child),
  ]));
}

export function canonicalReceipt({
  run_id,
  step_id,
  capability_id,
  adapter_id,
  exact_operation,
  arguments: args,
  status,
  result,
  started_at,
  ended_at,
  retry_count = 0,
  approval_id = null,
  read_back_status = 'not_required',
  artifacts = [],
  evidence_ids = [],
  resource_usage = {},
  limitations = null,
}) {
  const safeArguments = redact(args ?? {});
  const safeResult = redact(result ?? {});
  return {
    schema_version: '1.0',
    run_id,
    step_id,
    capability_id,
    adapter_id,
    exact_operation,
    arguments_hash: sha256(safeArguments),
    status,
    result_hash: sha256(safeResult),
    started_at,
    ended_at,
    retry_count,
    approval_id,
    read_back_status,
    returned_objects: safeResult.returned_objects ?? {},
    artifacts,
    evidence_ids,
    resource_usage,
    limitations,
  };
}

export function requiredContractTests() {
  return [...REQUIRED_TESTS];
}

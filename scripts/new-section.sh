#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -lt 3 ]; then
  echo "Usage: scripts/new-section.sh <PROJECT_ID> <SECTION_ID> <REASON>"
  exit 1
fi
PID="$1"; SID="$2"; REASON="$3"
BASE="project/${PID}"
SDIR="${BASE}/sections/${SID}"
mkdir -p "${SDIR}"
STATE="${SDIR}/state.json"
HANDOFF="${SDIR}/handoff.json"

cat > "${STATE}" <<'JSON'
{
  "project_id": "__PID__",
  "section_id": "__SID__",
  "version": "v1.0.0",
  "status": "CREATED",
  "actors": {
    "orchestrator": "sequential-orchestrator",
    "researcher": "data-researcher",
    "strategist": "content-strategist",
    "writer": "agile-technical-writer",
    "fact_checker": "rapid-fact-checker",
    "red_team": "adversarial-testing-agent",
    "conclave": "agent-conclave",
    "planner": "probabilistic-planner"
  },
  "artifacts": {
    "draft_md": "",
    "claims_json": "",
    "verification_json": "",
    "adversarial_json": "",
    "edit_md": "",
    "strategy_brief": ""
  },
  "metrics": {
    "verification_confidence": 0.0,
    "coverage": 0.0,
    "contradiction_score": 0.0
  },
  "flags": {"fos": false, "rework": false},
  "next_mode": "data-researcher"
}
JSON
sed -i "s/__PID__/${PID}/g; s/__SID__/${SID}/g" "${STATE}" 2>/dev/null || perl -0777 -pi -e "s/__PID__/${PID}/g;s/__SID__/${SID}/g" "${STATE}"

cat > "${HANDOFF}" <<JSON
{
  "section_id": "${SID}",
  "current_mode": "sequential-orchestrator",
  "next_mode": "data-researcher",
  "reason": "${REASON}",
  "required_inputs": [],
  "deadline_iso": ""
}
JSON

echo "Created ${STATE} and ${HANDOFF}"

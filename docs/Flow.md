# Research Flow (Roo Modes)

1. **sequential-orchestrator**: create project/sections; initialize `state.json`/`handoff.json`.
2. **data-researcher**: mine sources; produce `claims.vN.json`.
3. **content-strategist**: produce `strategy/{section}.brief.vN.json`.
4. **agile-technical-writer**: draft `draft.vN.md` (+ update claims if needed).
5. **rapid-fact-checker**: create `verification.vN.json`; compute gate & FoS.
6. **adversarial-testing-agent**: emit `adversarial.vN.json` (severity-ranked).
7. **agent-conclave** (if FoS): emit `control/conclave/session-{K}.json` with decision.
8. **agile-editor** (if present in your `.roomodes`): finalize `edit.vN.md`.
9. **probabilistic-planner**: adjust `control/planning/paths.json` priorities.

Artifacts are standardized by the JSON schemas in `/schemas`. All modes should read/write the canonical paths.

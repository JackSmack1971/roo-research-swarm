# Roo Research Swarm

A ready-to-clone repository that turns **Roo Code** into a structured, multi-agent **research workflow**.  
This repo gives you: project scaffolding, JSON schemas, VS Code config, scripts, and templates—so you can open the folder in VS Code and start researching immediately.

> You already have your `.roomodes` file; this repo **does not** include it. Follow the setup steps below to point your modes at the canonical file paths.

---

## Quick Start

1. **Clone**
   ```bash
   git clone https://github.com/YOUR_ORG/roo-research-swarm.git
   cd roo-research-swarm
   ```

2. **Open in VS Code**
   - Recommended extensions auto-install (see `.vscode/extensions.json`).

3. **Place your `.roomodes`**
   - Put your **patched** `.roomodes` in the workspace root (or wherever Roo expects it).
   - Ensure each mode's `customInstructions` uses the **Handoff Primer** you added.

4. **Initialize a project**
   ```bash
   # Bash
   scripts/new-section.sh P-001 S-001 "Initial drafting"
   scripts/new-section.sh P-001 S-002 "Second section"

   # PowerShell (Windows)
   scripts/new-section.ps1 -ProjectId P-001 -SectionId S-001 -Reason "Initial drafting"
   scripts/new-section.ps1 -ProjectId P-001 -SectionId S-002 -Reason "Second section"
   ```

5. **Run the flow (manual or scripted)**
   - Start with **data-researcher → content-strategist → agile-technical-writer → rapid-fact-checker → adversarial-testing-agent → agent-conclave (if FoS) → agile-editor → probabilistic-planner**.
   - Each mode reads/writes the canonical files under `/project/{project_id}/sections/{section_id}/`.

---

## Canonical Paths

```
/schemas/                      # JSON Schemas (contracts)
/project/{pid}/
  control/
    planning/paths.json
    conclave/
    postmortem/
  evidence/                    # saved HTML/PDF snapshots (hash-named)
  strategy/                    # strategist briefs per section
  sections/{sid}/
    state.json                 # section state incl. status/metrics/flags/next_mode
    handoff.json               # current_mode → next_mode + required_inputs
    draft.v{N}.md
    claims.v{N}.json
    verification.v{N}.json
    adversarial.v{N}.json
    edit.v{N}.md
```

---

## Quality Gate & FoS (you can tune)

- **Quality Gate (Fact Checker)**
  - Gate passes at `summary_confidence ≥ 0.90`
  - Otherwise set `flags.rework = true` and route back to `agile-technical-writer`

- **FoS (Finding of Significance)**
  - Set `flags.fos = true` if `contradiction_score ≥ 0.60` **or** two independent FoS flags within 24h
  - If `fos = true`, `next_mode = agent-conclave` (exclusive path)

---

## Scripts

- `scripts/new-section.sh` / `scripts/new-section.ps1`: create a new section with initialized `state.json` and `handoff.json`
- `scripts/verify-schemas.py`: validate repo JSONs against `/schemas`
- `scripts/print-tree.py`: quick directory tree view

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Security Policy

See [SECURITY.md](SECURITY.md).

## License

MIT — see [LICENSE](LICENSE).

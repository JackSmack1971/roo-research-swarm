# Roo Research Swarm

A ready-to-run repository that transforms **Roo Code** into a structured, multi-agent **research workflow**.

This project includes:

- **Fully patched `.roomodes`** file with Handoff Primers for all research modes  
- **Complete project structure** with canonical directories and JSON schemas  
- **VS Code configuration** for schema validation and productivity tooling  
- **Cross-platform scripts** to create new sections and validate artifacts  
- **Templates** for every artifact type (handoff, state, claims, verification, adversarial, conclave, paths)

Once cloned, you can open this project in **VS Code**, run Roo Code in the same folder, and immediately start coordinated research using the defined agent flow.

---

## Quick Start

### 1. Clone the Repository

```bash
git clone git@github.com:JackSmack1971/roo-research-swarm.git
cd roo-research-swarm
````

> 💡 **HTTPS Alternative:**
>
> ```bash
> git clone https://github.com/JackSmack1971/roo-research-swarm.git
> ```

---

### 2. Open in VS Code

* The `.vscode` folder contains recommended extensions and schema validation settings.
* JSON editing for artifacts (state, handoff, claims, etc.) is **schema-validated in real time**.

---

### 3. Verify `.roomodes` is Present

Your `.roomodes` file is already included and pre-patched with all research mode Handoff Primers:

```
sequential-orchestrator
data-researcher
content-strategist
agile-technical-writer
rapid-fact-checker
adversarial-testing-agent
agent-conclave
probabilistic-planner
```

---

### 4. Initialize Project Sections

Use the provided scripts to add sections to your research project.

**Bash (Linux/Mac/WSL):**

```bash
scripts/new-section.sh P-001 S-003 "New research topic"
```

**PowerShell (Windows):**

```powershell
scripts/new-section.ps1 -ProjectId P-001 -SectionId S-003 -Reason "New research topic"
```

---

### 5. Run the Research Flow

The recommended sequence for each section:

1. **sequential-orchestrator** → Sets up initial state & handoff
2. **data-researcher** → Mines sources, produces `claims.vN.json`
3. **content-strategist** → Writes strategy brief in `/strategy/{section}.brief.vN.json`
4. **agile-technical-writer** → Drafts `draft.vN.md` (updates claims if needed)
5. **rapid-fact-checker** → Produces `verification.vN.json`, applies Quality Gate & FoS rules
6. **adversarial-testing-agent** → Produces `adversarial.vN.json`
7. **agent-conclave** *(if FoS triggered)* → Makes pivot/continue decisions
8. **agile-editor** *(if included)* → Finalizes `edit.vN.md`
9. **probabilistic-planner** → Updates `/control/planning/paths.json`

---

## Canonical File Paths

```
/schemas/                      # JSON Schemas for all artifacts
/project/{pid}/
  control/
    planning/paths.json
    conclave/
    postmortem/
  evidence/                    # Saved HTML/PDF snapshots (hash-named)
  strategy/                    # Strategist briefs per section
  sections/{sid}/
    state.json
    handoff.json
    draft.v{N}.md
    claims.v{N}.json
    verification.v{N}.json
    adversarial.v{N}.json
    edit.v{N}.md
/templates/                    # Artifact templates
/scripts/                      # Helper scripts
```
---

## MCP Integration Map

This swarm relies on **Model Context Protocol (MCP)** servers for search, evidence capture, and file orchestration.

| Agent Mode | MCP Server(s) | Purpose in Flow |
|------------|---------------|-----------------|
| sequential-orchestrator | desktop-commander, sequential-thinking | Local file/folder orchestration, sequence control |
| data-researcher | perplexity-ask, exa, playwright, Context7 | Source mining, claim extraction, page snapshots |
| content-strategist | Context7 | Internal KB search for tone/messaging guidance |
| agile-technical-writer | desktop-commander | Draft creation & local saves |
| rapid-fact-checker | perplexity-ask, exa, playwright, Context7 | Claim verification, multi-source cross-check, evidence capture |
| adversarial-testing-agent | perplexity-ask, exa, playwright, Context7 | Contradiction hunting, vulnerability identification |
| agent-conclave | desktop-commander | Decision logging, plan updates |
| probabilistic-planner | desktop-commander | Planning file maintenance |

### API Keys & Config

| MCP Server | Config Needed |
|------------|--------------|
| Perplexity Ask | `PERPLEXITY_API_KEY` in MCP server env |
| Exa MCP | `EXA_API_KEY` in MCP server env |
| Playwright MCP | `PLAYWRIGHT_BROWSERS_PATH` set to local browser storage |
| Context7 MCP | Path to local KB or docs folder |
| Desktop Commander | None |
| Sequential Thinking | None |

See `/docs/Flow.md` for how each agent interacts with these MCP integrations.


## Quality Gate & FoS Rules

**Quality Gate (Fact Checker)**

* Pass: `summary_confidence ≥ 0.90` → next\_mode continues
* Fail: set `flags.rework = true` → send back to `agile-technical-writer`

**Finding of Significance (FoS)**

* Set `flags.fos = true` if:

  * `contradiction_score ≥ 0.60` OR
  * Two independent FoS flags in 24 hours
* If FoS triggered → next\_mode = `agent-conclave` (exclusive path)

---

## Utilities

* **Validate JSON Artifacts:**

```bash
pip install jsonschema
scripts/verify-schemas.py
```

* **Print Directory Tree:**

```bash
scripts/print-tree.py
```

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and [CODE\_OF\_CONDUCT.md](CODE_OF_CONDUCT.md) for behavior standards.

## License

MIT — see [LICENSE](LICENSE)

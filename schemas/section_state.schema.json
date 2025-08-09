# SPARC Research Swarm - Enhanced Workflow Guide

## Research Workflow Types

The system supports two distinct workflow types based on project requirements:

### 1. Standard Research Workflow (Original)

For general research projects requiring comprehensive analysis without SPARC development foundation:

1. **research-orchestrator** → Project initialization and workflow coordination
2. **data-researcher** → Mine sources, produce `claims.vN.json`
3. **rapid-fact-checker** → Create `verification.vN.json`; apply quality gates
4. **adversarial-testing-agent** → Emit `adversarial.vN.json` (severity-ranked)
5. **agent-conclave** (if FoS) → Emit `control/conclave/session-{K}.json` with decision
6. **probabilistic-planner** → Adjust `control/planning/paths.json` priorities

### 2. SPARC Autonomous Development Workflow (Enhanced)

For projects requiring complete autonomous development foundation with 99% autonomy:

#### Phase 1: Ultra-Comprehensive Research Foundation
1. **sparc-autonomous-orchestrator** → Master coordination for autonomous development foundation
2. **Parallel Ultra-Comprehensive Research**:
   - **sparc-domain-intelligence** → Exhaustive business and industry context (95%+ confidence)
   - **sparc-technology-architect** → Complete technology stack and implementation guidance  
   - **sparc-security-architect** → Complete security framework and threat mitigation
   - **sparc-requirements-architect** → Exhaustive requirements and user experience architecture
   - **sparc-operations-architect** → Complete DevOps and operational architecture
3. **sparc-autonomous-validator** → Comprehensive validation for autonomous development readiness
4. **sparc-autonomous-adversary** → Ultra-comprehensive risk analysis and mitigation planning

#### Phase 2: Autonomous Foundation Generation
5. **sparc-autonomous-synthesizer** → Complete Memory Bank and project foundation synthesis

#### Phase 3: Autonomous SPARC Development
6. **SPARC-ROO Development Modes** → Proceed with 99% autonomy using complete foundation

## Enhanced Artifacts and Quality Standards

### Standard Research Artifacts
- `claims.vN.json` - Research findings with standard confidence thresholds (80%+)
- `verification.vN.json` - Standard fact-checking and validation
- `adversarial.vN.json` - Standard risk analysis
- `strategy/{section}.brief.vN.json` - Strategic recommendations

### SPARC Autonomous Development Artifacts
- `claims.vN.json` - Research findings with autonomous development confidence (95%+)
- `verification.vN.json` - Enhanced validation for autonomous development readiness
- `adversarial.vN.json` - Comprehensive risk analysis for autonomous development
- `autonomous-synthesis.vN.json` - Complete foundation synthesis report
- **Enhanced Memory Bank**:
  - `memory-bank/productContext.md` - Complete business intelligence
  - `memory-bank/systemPatterns.md` - Exhaustive technology implementation guidance
  - `memory-bank/decisionLog.md` - Complete architectural decisions with rationale
  - `memory-bank/businessIntelligence.md` - Business strategy and market intelligence
  - `memory-bank/technicalArchitecture.md` - Technical implementation guidance
  - `memory-bank/securityFramework.md` - Security implementation roadmap
  - `memory-bank/operationalProcedures.md` - Deployment and operations guidance
  - `memory-bank/qualityAssurance.md` - Testing and validation strategies

## Quality Gates and Confidence Thresholds

### Standard Research Quality Gates
- **Quality Gate**: `summary_confidence ≥ 0.80` → proceed to next phase
- **Rework Threshold**: `summary_confidence < 0.80` → return for additional research
- **Finding of Significance (FoS)**: `contradiction_score ≥ 0.60` → escalate to conclave

### SPARC Autonomous Development Quality Gates
- **Autonomous Readiness Gate**: `summary_confidence ≥ 0.95` → proceed to synthesis
- **High Confidence Required**: All critical architectural decisions require 95%+ confidence
- **Complete Coverage**: 100% coverage of SPARC Memory Bank requirements
- **Zero Ambiguity**: Complete elimination of ambiguous or unclear specifications
- **Enhanced FoS**: `contradiction_score ≥ 0.40` → escalate due to higher autonomy requirements

## Canonical File Paths

### Standard Research Structure
```
/project/{pid}/
  control/
    planning/paths.json
    conclave/
  evidence/                    # Research evidence preservation
  strategy/                    # Strategic analysis briefs
  sections/{sid}/
    state.json
    handoff.json
    claims.v{N}.json
    verification.v{N}.json
    adversarial.v{N}.json
```

### SPARC Autonomous Development Structure
```
/project/{pid}/
  control/
    planning/sparc-research-plan.json
    synthesis/autonomous-synthesis-report.json
    validation/autonomous-readiness-assessment.json
    conclave/
  evidence/
    domain/                    # Business intelligence evidence
    technology/                # Technology research evidence
    security/                  # Security framework evidence
    requirements/              # Requirements pattern evidence
    operations/                # Operations research evidence
  business-intelligence/       # Domain research artifacts
  architecture-intelligence/  # Technology research artifacts
  security-intelligence/       # Security research artifacts
  requirements-intelligence/  # Requirements research artifacts
  operations-intelligence/    # Operations research artifacts
  sections/
    S-001-domain/             # Domain intelligence research
    S-002-technology/         # Technology architecture research
    S-003-security/           # Security architecture research
    S-004-requirements/       # Requirements architecture research
    S-005-operations/         # Operations architecture research
  synthesis/
    autonomous-foundation/    # Complete project foundation
    memory-bank/             # Enhanced Memory Bank files
    documentation/           # Complete documentation framework
    configuration/           # Project configuration files
```

## Research Section Types

### Standard Research Sections
- General research topics with standard depth and quality requirements
- Section IDs: `S-001`, `S-002`, `S-003`, etc.
- Standard confidence thresholds and quality gates

### SPARC Research Sections  
- Ultra-comprehensive research for autonomous development
- Section IDs: `S-001-domain`, `S-002-technology`, `S-003-security`, `S-004-requirements`, `S-005-operations`
- Enhanced confidence thresholds (95%+) and autonomous development focus
- Specialized research modes for each domain

## Workflow Selection Guidelines

### Choose Standard Research Workflow When:
- Conducting general research without development requirements
- Research depth requirements are standard (80%+ confidence acceptable)
- No SPARC development foundation needed
- Timeline prioritizes speed over comprehensiveness

### Choose SPARC Autonomous Development Workflow When:
- Building SPARC project foundations for autonomous development
- Requiring 99% autonomous development capabilities
- Need complete elimination of development questions and ambiguity
- Quality requirements demand 95%+ confidence in all decisions
- Project complexity requires comprehensive business, technical, and operational intelligence

## Usage Examples

### Standard Research Project Initialization
```bash
# Initialize standard research project
scripts/new-section.sh P-001 S-001 "Market analysis for fintech trends"

# Run standard research workflow
# 1. research-orchestrator
# 2. data-researcher  
# 3. rapid-fact-checker
# 4. adversarial-testing-agent
```

### SPARC Autonomous Development Project Initialization
```bash
# Initialize SPARC autonomous development foundation
scripts/sparc-autonomous-kickoff.sh P-001 "E-commerce Platform" "Modern e-commerce platform with microservices, 10k+ users, PCI compliance"

# Run SPARC autonomous development workflow
# 1. sparc-autonomous-orchestrator
# 2. Parallel ultra-comprehensive research across all domains
# 3. sparc-autonomous-validator
# 4. sparc-autonomous-adversary  
# 5. sparc-autonomous-synthesizer
# Result: Complete autonomous development foundation
```

All artifacts are standardized by enhanced JSON schemas in `/schemas`. SPARC modes read/write to canonical paths optimized for autonomous development workflow.

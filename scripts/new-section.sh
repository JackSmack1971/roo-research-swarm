#!/usr/bin/env bash
# SPARC Research Section Creator
# Creates specialized SPARC research sections for autonomous development

set -euo pipefail

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[SPARC]${NC} $1"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

usage() {
    cat << EOF
SPARC Research Section Creator

USAGE:
    $0 <PROJECT_ID> <RESEARCH_DOMAIN> <PROJECT_NAME> <PROJECT_DESCRIPTION>

RESEARCH_DOMAINS:
    domain        - Business intelligence and industry context
    technology    - Technology architecture and implementation guidance  
    security      - Security framework and threat mitigation
    requirements  - Requirements architecture and user experience
    operations    - DevOps and operational architecture

EXAMPLES:
    $0 P-001 domain "E-commerce Platform" "Modern e-commerce with microservices"
    $0 P-001 technology "E-commerce Platform" "React frontend, Node.js backend, PostgreSQL"
    $0 P-001 security "E-commerce Platform" "PCI compliance, OAuth, data encryption"

DESCRIPTION:
    Creates individual SPARC research sections for ultra-comprehensive
    autonomous development research. Each section targets 95%+ confidence
    and complete implementation guidance.

EOF
}

if [ "$#" -lt 4 ]; then
    print_error "Insufficient arguments provided"
    echo
    usage
    exit 1
fi

PROJECT_ID="$1"
RESEARCH_DOMAIN="$2"
PROJECT_NAME="$3"
PROJECT_DESCRIPTION="$4"

# Validate project ID format
if [[ ! "$PROJECT_ID" =~ ^P-[0-9]{3}$ ]]; then
    print_error "Project ID must be in format P-XXX (e.g., P-001)"
    exit 1
fi

# Validate research domain
case "$RESEARCH_DOMAIN" in
    domain|technology|security|requirements|operations)
        ;;
    *)
        print_error "Invalid research domain. Must be: domain, technology, security, requirements, or operations"
        exit 1
        ;;
esac

# Map research domain to section details
case "$RESEARCH_DOMAIN" in
    domain)
        SECTION_NUMBER="001"
        SECTION_DESC="Domain Intelligence Research"
        RESEARCHER_MODE="sparc-domain-intelligence"
        RESEARCH_FOCUS="Exhaustive business and industry context for autonomous development"
        ;;
    technology)
        SECTION_NUMBER="002"
        SECTION_DESC="Technology Architecture Research"
        RESEARCHER_MODE="sparc-technology-architect"
        RESEARCH_FOCUS="Complete technology stack and implementation guidance"
        ;;
    security)
        SECTION_NUMBER="003"
        SECTION_DESC="Security Architecture Research"
        RESEARCHER_MODE="sparc-security-architect"
        RESEARCH_FOCUS="Complete security framework and threat mitigation"
        ;;
    requirements)
        SECTION_NUMBER="004"
        SECTION_DESC="Requirements Architecture Research"
        RESEARCHER_MODE="sparc-requirements-architect"
        RESEARCH_FOCUS="Exhaustive requirements and user experience architecture"
        ;;
    operations)
        SECTION_NUMBER="005"
        SECTION_DESC="Operations Architecture Research"
        RESEARCHER_MODE="sparc-operations-architect"
        RESEARCH_FOCUS="Complete DevOps and operational architecture"
        ;;
esac

SECTION_ID="S-${SECTION_NUMBER}-${RESEARCH_DOMAIN}"

print_status "🎯 Creating SPARC Research Section"
print_status "Project: ${PROJECT_NAME} (${PROJECT_ID})"
print_status "Domain: ${RESEARCH_DOMAIN} (${SECTION_ID})"
print_status "Target: 95%+ Confidence, Complete Implementation Guidance"
echo

# Create project structure
BASE="project/${PROJECT_ID}"
SECTION_DIR="${BASE}/sections/${SECTION_ID}"
EVIDENCE_DIR="${BASE}/evidence/${RESEARCH_DOMAIN}"
INTELLIGENCE_DIR="${BASE}/${RESEARCH_DOMAIN}-intelligence"

print_status "Creating SPARC section structure..."

# Create directories
mkdir -p "${SECTION_DIR}"
mkdir -p "${EVIDENCE_DIR}"
mkdir -p "${INTELLIGENCE_DIR}"
mkdir -p "${BASE}/control/planning"
mkdir -p "${BASE}/control/synthesis"
mkdir -p "${BASE}/control/validation"

print_success "Directory structure created"

# Create enhanced section state for SPARC autonomous development
print_status "Generating SPARC section state..."

cat > "${SECTION_DIR}/state.json" << JSON
{
  "project_id": "${PROJECT_ID}",
  "section_id": "${SECTION_ID}",
  "version": "v1.0.0",
  "status": "CREATED",
  "sparc_context": {
    "research_domain": "${RESEARCH_DOMAIN}",
    "autonomous_development_target": true,
    "confidence_threshold": 0.95,
    "target_memory_bank_files": [
      "productContext.md",
      "systemPatterns.md",
      "decisionLog.md",
      "businessIntelligence.md",
      "technicalArchitecture.md",
      "securityFramework.md",
      "operationalProcedures.md",
      "qualityAssurance.md"
    ],
    "target_documentation": [
      "specification.md",
      "architecture.md",
      "security/",
      "operations/",
      "testing/",
      "troubleshooting/"
    ],
    "sparc_phase_relevance": [
      "specification",
      "architecture",
      "refinement",
      "completion"
    ]
  },
  "actors": {
    "orchestrator": "sparc-autonomous-orchestrator",
    "researcher": "${RESEARCHER_MODE}",
    "fact_checker": "sparc-autonomous-validator",
    "red_team": "sparc-autonomous-adversary",
    "synthesizer": "sparc-autonomous-synthesizer",
    "planner": "probabilistic-planner"
  },
  "artifacts": {
    "claims_json": "",
    "verification_json": "",
    "adversarial_json": "",
    "synthesis_output": "",
    "intelligence_artifacts": []
  },
  "metrics": {
    "verification_confidence": 0.0,
    "sparc_relevance_score": 0.0,
    "autonomous_development_readiness": 0.0,
    "coverage": 0.0,
    "contradiction_score": 0.0,
    "implementation_guidance_completeness": 0.0
  },
  "flags": {
    "fos": false,
    "rework": false,
    "autonomous_development_ready": false,
    "synthesis_approved": false,
    "high_confidence_research": false,
    "comprehensive_coverage": false
  },
  "next_mode": "${RESEARCHER_MODE}"
}
JSON

print_success "SPARC section state created"

# Create enhanced section handoff
print_status "Generating SPARC handoff configuration..."

cat > "${SECTION_DIR}/handoff.json" << JSON
{
  "section_id": "${SECTION_ID}",
  "current_mode": "sparc-autonomous-orchestrator",
  "next_mode": "${RESEARCHER_MODE}",
  "reason": "${SECTION_DESC} for 99% Autonomous Development",
  "sparc_requirements": {
    "project_name": "${PROJECT_NAME}",
    "description": "${PROJECT_DESCRIPTION}",
    "research_focus": "${RESEARCH_FOCUS}",
    "autonomous_development_target": true,
    "confidence_threshold": 0.95,
    "comprehensive_coverage_required": true,
    "implementation_guidance_required": true,
    "question_elimination_target": true
  },
  "required_inputs": [],
  "deadline_iso": "",
  "autonomous_development_context": {
    "eliminates_questions": [
      "What technology should I use?",
      "How should this be implemented?",
      "What are the security requirements?",
      "What are the exact requirements?",
      "How do I deploy and monitor this?",
      "What are the performance requirements?",
      "How do I handle edge cases?",
      "What are the integration requirements?"
    ],
    "provides_implementation_guidance": true,
    "supports_sparc_phases": [
      "specification",
      "pseudocode",
      "architecture",
      "refinement",
      "completion"
    ],
    "expected_confidence_level": 0.95,
    "comprehensive_coverage_areas": [
      "${RESEARCH_DOMAIN}_patterns",
      "${RESEARCH_DOMAIN}_best_practices",
      "${RESEARCH_DOMAIN}_implementation_guidance",
      "${RESEARCH_DOMAIN}_troubleshooting_procedures",
      "${RESEARCH_DOMAIN}_quality_assurance"
    ]
  }
}
JSON

print_success "SPARC handoff configuration created"

# Create research guidance document
print_status "Generating research guidance documentation..."

cat > "${SECTION_DIR}/RESEARCH_GUIDANCE.md" << EOF
# ${SECTION_DESC} - SPARC Autonomous Development

## Research Objective
${RESEARCH_FOCUS}

## Autonomous Development Requirements
- **Confidence Target**: 95%+ for all critical decisions
- **Implementation Guidance**: Complete and actionable for all scenarios
- **Question Elimination**: Zero remaining questions for autonomous development
- **SPARC Compliance**: Full alignment with SPARC methodology requirements

## Research Focus Areas

### ${RESEARCH_DOMAIN^} Research Priorities
1. **Comprehensive Pattern Analysis**: Research all applicable patterns and best practices
2. **Implementation Guidance**: Detailed implementation procedures and examples
3. **Decision Support**: Complete rationale for all architectural and implementation decisions
4. **Risk Mitigation**: Comprehensive risk analysis and mitigation strategies
5. **Quality Assurance**: Testing, validation, and quality control procedures

### Expected Outputs
- **claims.v1.json**: Research findings with 95%+ confidence and implementation guidance
- **verification.v1.json**: Comprehensive validation with autonomous development assessment
- **adversarial.v1.json**: Risk analysis and mitigation strategies
- **Intelligence Artifacts**: Detailed research materials and evidence

### Success Criteria
- ✅ 95%+ confidence in all critical ${RESEARCH_DOMAIN} decisions
- ✅ Complete implementation guidance for all ${RESEARCH_DOMAIN} scenarios
- ✅ Zero ambiguity in ${RESEARCH_DOMAIN} specifications
- ✅ Comprehensive risk mitigation for ${RESEARCH_DOMAIN} concerns
- ✅ Full SPARC methodology compliance and integration

## Research Methodology
1. **Ultra-Comprehensive Research**: Exhaustive analysis of all relevant sources
2. **Implementation Focus**: Prioritize actionable, implementation-ready guidance
3. **Quality Validation**: Multi-source verification and confidence assessment
4. **Autonomous Development Optimization**: Structure findings to eliminate development questions

## Integration with Memory Bank
Research findings will be integrated into:
- **${RESEARCH_DOMAIN}-specific Memory Bank files**
- **Cross-domain decision documentation**
- **Complete implementation procedures**
- **Comprehensive troubleshooting guides**

Ready for ${RESEARCHER_MODE} execution.
EOF

print_success "Research guidance documentation created"

# Create evidence collection template
cat > "${EVIDENCE_DIR}/README.md" << EOF
# ${RESEARCH_DOMAIN^} Research Evidence

This directory contains preserved evidence for ${RESEARCH_DOMAIN} research with hash-based storage for verification and traceability.

## Evidence Categories
- **Primary Sources**: Official documentation, standards, and authoritative guides
- **Implementation Examples**: Working code examples and configuration templates
- **Performance Data**: Benchmarks, scalability studies, and optimization evidence
- **Security Analysis**: Threat assessments, vulnerability studies, and mitigation guides
- **Best Practices**: Industry standards and proven implementation patterns

## File Naming Convention
- **Format**: \`{evidence_hash}.{extension}\`
- **Types**: .html, .pdf, .json, .md
- **Metadata**: Tracked in claims.json with source attribution

## Quality Standards
- **Authority Score**: 0.8+ for primary sources
- **Recency**: Preference for sources within 2 years
- **Implementation Relevance**: 0.9+ for autonomous development guidance
- **Cross-Validation**: Multiple sources for critical decisions
EOF

# Create intelligence artifacts directory
cat > "${INTELLIGENCE_DIR}/README.md" << EOF
# ${RESEARCH_DOMAIN^} Intelligence Artifacts

This directory contains processed research artifacts and intelligence analysis for ${RESEARCH_DOMAIN} autonomous development.

## Artifact Types
- **Pattern Analysis**: Comprehensive pattern documentation and implementation guides
- **Decision Trees**: Decision support frameworks for autonomous development
- **Implementation Templates**: Ready-to-use configuration and code templates
- **Troubleshooting Guides**: Comprehensive problem resolution procedures
- **Quality Checklists**: Validation and quality assurance procedures

## Integration Points
- **Memory Bank**: Direct integration with SPARC Memory Bank files
- **Documentation**: Population of SPARC documentation templates
- **Configuration**: Generation of project-specific configuration files
- **Automation**: Support for autonomous development workflow

## Quality Standards
- **Actionability**: All artifacts must be immediately implementable
- **Completeness**: 100% coverage of autonomous development scenarios
- **Clarity**: Clear, unambiguous guidance for all procedures
- **Traceability**: Full attribution to research sources and evidence
EOF

print_success "Evidence and intelligence directories initialized"

# Summary and next steps
echo
print_status "🎯 SPARC Research Section Created Successfully!"
echo
echo -e "${GREEN}Section Details:${NC}"
echo "  📁 Section ID: ${SECTION_ID}"
echo "  🔬 Research Domain: ${RESEARCH_DOMAIN}"
echo "  📛 Project: ${PROJECT_NAME} (${PROJECT_ID})"
echo "  🎯 Confidence Target: 95%+"
echo "  🤖 Researcher Mode: ${RESEARCHER_MODE}"
echo
echo -e "${YELLOW}Files Created:${NC}"
echo "  📋 ${SECTION_DIR}/state.json"
echo "  🔄 ${SECTION_DIR}/handoff.json"
echo "  📖 ${SECTION_DIR}/RESEARCH_GUIDANCE.md"
echo "  🗃️  ${EVIDENCE_DIR}/ (evidence collection)"
echo "  🧠 ${INTELLIGENCE_DIR}/ (intelligence artifacts)"
echo
echo -e "${BLUE}Next Steps:${NC}"
echo "  1️⃣  Execute ${RESEARCHER_MODE} for ultra-comprehensive research"
echo "  2️⃣  Achieve 95%+ confidence with complete implementation guidance"
echo "  3️⃣  Validate autonomous development readiness"
echo "  4️⃣  Integrate findings into SPARC Memory Bank synthesis"
echo
echo -e "${GREEN}Research Objective:${NC}"
echo "  🎯 ${RESEARCH_FOCUS}"
echo "  📊 Target: Zero questions remaining for autonomous development"
echo
print_success "Ready for SPARC ${RESEARCH_DOMAIN} research execution!"

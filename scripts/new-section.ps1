param(
  [Parameter(Mandatory=$true)][string]$ProjectId,
  [Parameter(Mandatory=$true)][string]$SectionId,
  [Parameter(Mandatory=$true)][string]$Reason
)

$base = "project/$ProjectId"
$sectionDir = "$base/sections/$SectionId"
New-Item -ItemType Directory -Force -Path $sectionDir | Out-Null

$state = @{
  project_id = $ProjectId
  section_id = $SectionId
  version = "v1.0.0"
  status = "CREATED"
  actors = @{
    orchestrator = "sequential-orchestrator"
    researcher = "data-researcher"
    strategist = "content-strategist"
    writer = "agile-technical-writer"
    fact_checker = "rapid-fact-checker"
    red_team = "adversarial-testing-agent"
    conclave = "agent-conclave"
    planner = "probabilistic-planner"
  }
  artifacts = @{
    draft_md = ""
    claims_json = ""
    verification_json = ""
    adversarial_json = ""
    edit_md = ""
    strategy_brief = ""
  }
  metrics = @{
    verification_confidence = 0.0
    coverage = 0.0
    contradiction_score = 0.0
  }
  flags = @{ fos = $false; rework = $false }
  next_mode = "data-researcher"
} | ConvertTo-Json -Depth 6

$handoff = @{
  section_id = $SectionId
  current_mode = "sequential-orchestrator"
  next_mode = "data-researcher"
  reason = $Reason
  required_inputs = @()
  deadline_iso = ""
} | ConvertTo-Json -Depth 5

$state | Out-File -FilePath "$sectionDir/state.json" -Encoding utf8
$handoff | Out-File -FilePath "$sectionDir/handoff.json" -Encoding utf8

Write-Host "Created $sectionDir/state.json and handoff.json"

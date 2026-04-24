# new-problem.ps1
# Creates a new problem folder pre-populated with template files.
#
# Usage:
#   .\scripts\new-problem.ps1 -Topic arrays -Slug two-sum
#   .\scripts\new-problem.ps1 -Topic dynamic-programming -Slug coin-change
#
# Available topics:
#   arrays, strings, linked-lists, stacks-and-queues, trees,
#   binary-search-trees, graphs, dynamic-programming, binary-search,
#   hashing, two-pointers, sliding-window, recursion-and-backtracking,
#   sorting-and-searching, greedy, heaps-and-priority-queues,
#   math-and-bit-manipulation, tries

param(
    [Parameter(Mandatory = $true)]
    [string]$Topic,

    [Parameter(Mandatory = $true)]
    [string]$Slug
)

$root        = Split-Path -Parent $PSScriptRoot
$templateDir = Join-Path $root "templates"
$problemDir  = Join-Path $root "topics\$Topic\$Slug"

# Validate topic folder exists
$topicDir = Join-Path $root "topics\$Topic"
if (-not (Test-Path $topicDir)) {
    Write-Host "ERROR: Topic '$Topic' does not exist under topics/." -ForegroundColor Red
    Write-Host "Available topics:" -ForegroundColor Yellow
    Get-ChildItem (Join-Path $root "topics") -Directory | ForEach-Object { Write-Host "  - $($_.Name)" }
    exit 1
}

# Prevent overwriting existing problem
if (Test-Path $problemDir) {
    Write-Host "ERROR: Problem directory already exists: $problemDir" -ForegroundColor Yellow
    exit 1
}

# Create problem directory
New-Item -ItemType Directory -Path $problemDir | Out-Null

# Copy templates
Copy-Item "$templateDir\solution.py"         "$problemDir\solution.py"
Copy-Item "$templateDir\Solution.java"       "$problemDir\Solution.java"
Copy-Item "$templateDir\solution.cpp"        "$problemDir\solution.cpp"
Copy-Item "$templateDir\solution.js"         "$problemDir\solution.js"
Copy-Item "$templateDir\problem-README.md"   "$problemDir\README.md"

Write-Host ""
Write-Host "Problem created successfully!" -ForegroundColor Green
Write-Host "  Path: $problemDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "Files:"
Get-ChildItem $problemDir | ForEach-Object { Write-Host "  $($_.Name)" }
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Fill in README.md with the problem info and your approach"
Write-Host "  2. Solve the problem in your preferred language(s)"
Write-Host "  3. Commit:  git add . && git commit -m `"Day XX: <Problem Name>`""

# new-problem.ps1
# Creates a new problem folder with README.md + Python solution by default.
# Optionally scaffold additional languages with -Language.
#
# Usage:
#   .\scripts\new-problem.ps1 -Topic arrays -Slug two-sum
#   .\scripts\new-problem.ps1 -Topic graphs -Slug number-of-islands -Language java
#   .\scripts\new-problem.ps1 -Topic dp -Slug coin-change -Language cpp,js
#
# -Language accepts a comma-separated list: py (default), java, cpp, js
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
    [string]$Slug,

    # Comma-separated extra languages in addition to Python: java, cpp, js
    [string]$Language = ""
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

# Always copy README + Python template
Copy-Item "$templateDir\problem-README.md" "$problemDir\README.md"
Copy-Item "$templateDir\solution.py"       "$problemDir\solution.py"

# Copy any extra language templates requested
$langMap = @{
    "java" = @{ src = "Solution.java"; dest = "Solution.java" }
    "cpp"  = @{ src = "solution.cpp";  dest = "solution.cpp"  }
    "js"   = @{ src = "solution.js";   dest = "solution.js"   }
}

if ($Language -ne "") {
    foreach ($lang in ($Language -split "," | ForEach-Object { $_.Trim().ToLower() })) {
        if ($lang -eq "py") { continue }   # already added
        if ($langMap.ContainsKey($lang)) {
            $entry = $langMap[$lang]
            Copy-Item "$templateDir\$($entry.src)" "$problemDir\$($entry.dest)"
        } else {
            Write-Host "WARNING: Unknown language '$lang' — skipped. Valid options: java, cpp, js" -ForegroundColor Yellow
        }
    }
}

Write-Host ""
Write-Host "Problem created!" -ForegroundColor Green
Write-Host "  Path: $problemDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "Files:"
Get-ChildItem $problemDir | ForEach-Object { Write-Host "  $($_.Name)" }
Write-Host ""
Write-Host "Tip: add another language later with:" -ForegroundColor Yellow
Write-Host "  Copy-Item templates\solution.cpp topics\$Topic\$Slug\solution.cpp"
Write-Host ""
Write-Host "When done, commit:" -ForegroundColor Yellow
Write-Host "  git add . ; git commit -m `"<Problem Name> — <Topic> [Easy/Medium/Hard]`""

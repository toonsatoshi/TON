$ErrorActionPreference = 'Stop'

$rootDir = Resolve-Path "$PSScriptRoot/.."

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Error "[bootstrap] Missing required tool: node. Install Node.js 20+ and re-run."
}

if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
  Write-Error "[bootstrap] Missing required tool: npm. Install Node.js 20+ and re-run."
}

Write-Host "[bootstrap] Installing root dependencies"
npm install --prefix $rootDir

Write-Host "[bootstrap] Installing frontend dependencies"
npm install --prefix "$rootDir/frontend"

Write-Host "[bootstrap] Bootstrap complete"
Write-Host "[bootstrap] Next steps:"
Write-Host "  1) Run tests: npm test"
Write-Host "  2) Start frontend: npm run dev --prefix frontend"

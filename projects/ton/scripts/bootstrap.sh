#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_tools=(node npm)
for tool in "${required_tools[@]}"; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "[bootstrap] Missing required tool: $tool"
    echo "[bootstrap] Install Node.js 20+ (includes npm) and re-run."
    exit 1
  fi
done

echo "[bootstrap] Installing root dependencies"
npm install --prefix "$ROOT_DIR"

echo "[bootstrap] Installing frontend dependencies"
npm install --prefix "$ROOT_DIR/frontend"

echo "[bootstrap] Bootstrap complete"
echo "[bootstrap] Next steps:"
echo "  1) Run tests: npm test"
echo "  2) Start frontend: npm run dev --prefix frontend"

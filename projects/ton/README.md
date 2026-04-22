# TON Fixed-Yield Protocol (Portfolio Project)

This directory contains one project within the official TON portfolio repository: a scaffold for a fixed-yield protocol built with **Tact** contracts and a **Next.js + Telegram Mini App** frontend.

## What is included

### Smart contract scaffold (`contracts/`)
Core protocol modules are stubbed with interfaces, storage, and message shapes for:

- Market factory
- Vault (PT/YT mint + redeem flows)
- PT and YT jetton masters
- PT/asset AMM
- Yield oracle
- Fee distributor

### Shared libraries (`libs/`)
- Constants
- Error codes
- Protocol message schema
- Math utility stubs for future fixed-point implementations

### Frontend scaffold (`frontend/`)
- Market cards and swap panel foundations
- Base Next.js app structure for TON/TMA UX integration

### Tooling and scripts
- Bootstrap scripts for quick local setup
- Make targets for testing and frontend development
- Initial test-plan skeletons (`tests/`)

## Quick start

From this directory (`projects/ton`):

### macOS/Linux

```bash
make bootstrap
```

### Windows (PowerShell)

```powershell
make bootstrap-windows
```

## Development commands

```bash
# Run scaffold tests
make test

# Start frontend app
make dev
```

## Suggested implementation sequence

1. Complete contract handlers with validation and execution logic.
2. Implement robust fixed-point math primitives (`mulDiv`, `ln`, `exp`, Newton methods) plus unit tests.
3. Wire AMM quote and swap execution through jetton notification flows.
4. Integrate TON Connect and chain reads for live dashboard metrics.
5. Expand end-to-end tests for mint/redeem, swaps, and fee distribution.

## Portfolio context

This project is part of the root-level portfolio monorepo.

- Portfolio README: `../../README.md`
- Project path: `projects/ton`

As the portfolio expands, shared standards and tooling may be hoisted to root-level directories.

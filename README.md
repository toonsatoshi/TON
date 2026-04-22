# TON Portfolio Repository

This repository is now structured as a **multi-project portfolio** centered on TON ecosystem work.

## Repository purpose

Use this repo as the official home for:

- TON protocol experiments
- production-intent protocol implementations
- documentation, architecture notes, and research artifacts
- future companion projects (indexers, bots, analytics, SDKs, etc.)

## Monorepo layout

```text
.
├── projects/
│   └── ton/               # Fixed-yield TON protocol scaffold (current primary project)
└── README.md              # Portfolio-level overview (this file)
```

## Active projects

### 1) `projects/ton`
A fixed-yield protocol scaffold using Tact smart contracts and a Next.js / Telegram Mini App frontend.

- Contract scaffolding for core protocol modules
- Frontend scaffolding for market and swap UX
- Test and bootstrap scripts for fast iteration

➡ See the project README for setup and development details:
`projects/ton/README.md`

## Portfolio roadmap

Planned additions to this repository include:

- Additional TON DeFi primitives and strategy vaults
- Shared tooling across projects (linting, local chain scripts, CI workflows)
- Common architecture decision records (ADRs)
- Reusable UI and SDK packages where appropriate

## Working conventions

- Each portfolio project lives under `projects/<project-name>`.
- Each project should include its own `README.md` and local scripts.
- Portfolio-level standards and cross-project docs will remain at the root as the repo grows.

---

If you're reviewing this repository for collaboration or hiring, start with:

1. `projects/ton/README.md`
2. `projects/ton/contracts/`
3. `projects/ton/frontend/`

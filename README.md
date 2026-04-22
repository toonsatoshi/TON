# TON Yield Protocol Scaffold

Initial scaffold for a TON fixed-yield protocol using **Tact** contracts and a **Next.js/TMA** frontend.

## Implemented in this bootstrap

- Contract-level interfaces and storage layouts for:
  - Market factory
  - Vault (PT/YT mint/redeem)
  - PT and YT jetton masters
  - PT/asset AMM
  - Yield oracle
  - Fee distributor
- Shared protocol constants, errors, math stubs, and message schema.
- Blueprint-style test plan skeletons.
- Frontend component scaffold for market cards and swap panel.

## Next implementation steps

1. Fill contract handlers with full message logic and validation.
2. Implement fixed-point math library (`mulDiv`, `ln`, `exp`, Newton solver) and unit tests.
3. Wire AMM quote + swap execution through jetton notifications.
4. Add TON Connect integration and live chain reads for dashboard metrics.

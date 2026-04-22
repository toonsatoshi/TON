import { describe, expect, it } from 'vitest';

type Reserves = {
  assetReserve: bigint;
  ptReserve: bigint;
};

const BPS_DENOM = 10_000n;

function swapExactAssetForPt(
  reserves: Reserves,
  amountIn: bigint,
  feeBps: bigint,
): { ptOut: bigint; next: Reserves } {
  if (amountIn <= 0n) throw new Error('ERROR_ZERO_AMOUNT');
  if (feeBps < 0n || feeBps > 1000n) throw new Error('ERROR_INSUFFICIENT_OUTPUT');

  const amountInAfterFee = (amountIn * (BPS_DENOM - feeBps)) / BPS_DENOM;
  if (amountInAfterFee <= 0n) throw new Error('ERROR_INSUFFICIENT_OUTPUT');

  const ptOut = (reserves.ptReserve * amountInAfterFee) / (reserves.assetReserve + amountInAfterFee);
  if (ptOut <= 0n) throw new Error('ERROR_INSUFFICIENT_OUTPUT');

  return {
    ptOut,
    next: {
      assetReserve: reserves.assetReserve + amountInAfterFee,
      ptReserve: reserves.ptReserve - ptOut,
    },
  };
}

function swapExactPtForAsset(
  reserves: Reserves,
  ptIn: bigint,
  feeBps: bigint,
): { assetOut: bigint; next: Reserves } {
  if (ptIn <= 0n) throw new Error('ERROR_ZERO_AMOUNT');
  if (feeBps < 0n || feeBps > 1000n) throw new Error('ERROR_INSUFFICIENT_OUTPUT');

  const ptInAfterFee = (ptIn * (BPS_DENOM - feeBps)) / BPS_DENOM;
  if (ptInAfterFee <= 0n) throw new Error('ERROR_INSUFFICIENT_OUTPUT');

  const assetOut = (reserves.assetReserve * ptInAfterFee) / (reserves.ptReserve + ptInAfterFee);
  if (assetOut <= 0n) throw new Error('ERROR_INSUFFICIENT_OUTPUT');

  return {
    assetOut,
    next: {
      assetReserve: reserves.assetReserve - assetOut,
      ptReserve: reserves.ptReserve + ptInAfterFee,
    },
  };
}

describe('AMM constant-product reserve accounting', () => {
  it('decreases PT reserve and increases asset reserve on asset->PT swap', () => {
    const start = { assetReserve: 1_000_000n, ptReserve: 1_000_000n };

    const { ptOut, next } = swapExactAssetForPt(start, 100_000n, 30n);

    expect(ptOut).toBeGreaterThan(0n);
    expect(next.assetReserve).toBeGreaterThan(start.assetReserve);
    expect(next.ptReserve).toBeLessThan(start.ptReserve);
  });

  it('decreases asset reserve and increases PT reserve on PT->asset swap', () => {
    const start = { assetReserve: 2_500_000n, ptReserve: 3_000_000n };

    const { assetOut, next } = swapExactPtForAsset(start, 250_000n, 25n);

    expect(assetOut).toBeGreaterThan(0n);
    expect(next.assetReserve).toBeLessThan(start.assetReserve);
    expect(next.ptReserve).toBeGreaterThan(start.ptReserve);
  });

  it('rejects zero-sized swaps', () => {
    const start = { assetReserve: 1_000_000n, ptReserve: 1_000_000n };

    expect(() => swapExactAssetForPt(start, 0n, 30n)).toThrow('ERROR_ZERO_AMOUNT');
    expect(() => swapExactPtForAsset(start, 0n, 30n)).toThrow('ERROR_ZERO_AMOUNT');
  });

  it('rejects out-of-range fee values', () => {
    const start = { assetReserve: 1_000_000n, ptReserve: 1_000_000n };

    expect(() => swapExactAssetForPt(start, 100n, 1001n)).toThrow('ERROR_INSUFFICIENT_OUTPUT');
    expect(() => swapExactPtForAsset(start, 100n, -1n)).toThrow('ERROR_INSUFFICIENT_OUTPUT');
  });
});

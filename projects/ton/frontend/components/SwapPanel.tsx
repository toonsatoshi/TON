import React from 'react';

export function SwapPanel() {
  return (
    <section className="rounded-2xl border border-slate-800 bg-slate-900/70 p-4 text-slate-100">
      <h2 className="text-lg font-semibold">Swap</h2>
      <p className="mt-2 text-sm text-slate-400">
        Buy/Sell PT and YT with slippage, price impact, and implied APY preview.
      </p>
      <button className="mt-4 rounded-xl bg-[#0098EA] px-4 py-2 font-medium text-white">
        Swap
      </button>
    </section>
  );
}

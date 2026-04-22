import React from 'react';
import { MarketCard } from '../components/MarketCard';
import { SwapPanel } from '../components/SwapPanel';

export default function Page() {
  return (
    <main className="mx-auto max-w-3xl space-y-4 p-6">
      <h1 className="text-2xl font-bold text-slate-100">TonYield</h1>
      <MarketCard underlying="tsTON" expiryLabel="Dec 2026" impliedApy="8.3%" daysLeft={91} />
      <SwapPanel />
    </main>
  );
}

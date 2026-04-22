import React from 'react';

type MarketCardProps = {
  underlying: string;
  expiryLabel: string;
  impliedApy: string;
  daysLeft: number;
};

export function MarketCard({ underlying, expiryLabel, impliedApy, daysLeft }: MarketCardProps) {
  return (
    <div className="rounded-2xl border border-slate-800 bg-slate-900/70 p-4 text-slate-100">
      <div className="flex items-center justify-between">
        <div>
          <p className="text-lg font-semibold">{underlying}</p>
          <p className="text-sm text-slate-400">{expiryLabel}</p>
        </div>
        <p className="text-ton-blue font-semibold">{impliedApy} APY</p>
      </div>
      <p className="mt-3 text-sm text-slate-300">{daysLeft}d left</p>
    </div>
  );
}

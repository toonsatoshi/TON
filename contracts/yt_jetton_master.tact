contract YTJettonMaster {
  vault: Address;
  total_supply: Int;
  content: Cell;
  wallet_code: Cell;
  yield_index_snapshot: Int;
  cumulative_yield_per_token: Int;

  // TODO: reward-debt accounting + transfer-time harvest logic.
}

contract FeeDistributor {
  governance_token: Address;
  total_staked: Int;
  cumulative_fees_per_token: Int;
  fee_token: Address;
  pending_fees: Int;

  // TODO: implement stake/unstake/claim with reward-debt accounting.
}

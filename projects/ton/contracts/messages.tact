// Shared protocol messages (single source of truth)

message DeployMarket {
  underlying_jetton: Address;
  expiry: Int;
  amm_fee_bps: Int;
}

message GetMarket {
  market_id: Int;
}

message RedeemPT {
  pt_amount: Int;
  recipient: Address;
}

message ClaimYield {
  yt_amount: Int;
  recipient: Address;
}

message UpdateYieldIndex {}

message YieldIndexUpdate {
  new_index: Int;
}

message SwapExactAssetForPT {
  amount_in: Int;
  min_pt_out: Int;
  recipient: Address;
}

message SwapExactPTForAsset {
  pt_in: Int;
  min_asset_out: Int;
  recipient: Address;
}

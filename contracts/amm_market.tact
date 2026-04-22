import "./messages.tact";

contract AmmMarket {
  vault: Address;
  pt_reserve: Int;
  asset_reserve: Int;
  lp_token_master: Address;
  total_lp_supply: Int;
  fee_bps: Int;
  protocol_fee_bps: Int;
  fee_collector: Address;
  expiry: Int;
  scalar_root: Int;
  initial_anchor: Int;

  receive(msg: SwapExactAssetForPT) {
    // TODO: compute PT out from yield-space curve and execute transfer.
  }

  receive(msg: SwapExactPTForAsset) {
    // TODO: compute asset out and execute transfer.
  }
}

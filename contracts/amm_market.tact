import "./messages.tact";
import "./errors.tact";
import "./constants.tact";

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
    require(msg.amount_in > 0, ERROR_ZERO_AMOUNT);
    require(this.pt_reserve > 0, ERROR_INSUFFICIENT_OUTPUT);
    require(this.asset_reserve > 0, ERROR_INSUFFICIENT_OUTPUT);
    require(this.fee_bps >= 0, ERROR_INSUFFICIENT_OUTPUT);
    require(this.fee_bps <= MAX_FEE_BPS, ERROR_INSUFFICIENT_OUTPUT);

    let amount_in_after_fee: Int = (msg.amount_in * (10000 - this.fee_bps)) / 10000;
    require(amount_in_after_fee > 0, ERROR_INSUFFICIENT_OUTPUT);

    let pt_out: Int = (this.pt_reserve * amount_in_after_fee) / (this.asset_reserve + amount_in_after_fee);
    require(pt_out >= msg.min_pt_out, ERROR_INSUFFICIENT_OUTPUT);
    require(pt_out > 0, ERROR_INSUFFICIENT_OUTPUT);

    this.asset_reserve = this.asset_reserve + amount_in_after_fee;
    this.pt_reserve = this.pt_reserve - pt_out;

    // NOTE: token transfer plumbing is implemented later through jetton notifications.
    // For now the contract keeps deterministic reserve accounting.
  }

  receive(msg: SwapExactPTForAsset) {
    require(msg.pt_in > 0, ERROR_ZERO_AMOUNT);
    require(this.pt_reserve > 0, ERROR_INSUFFICIENT_OUTPUT);
    require(this.asset_reserve > 0, ERROR_INSUFFICIENT_OUTPUT);
    require(this.fee_bps >= 0, ERROR_INSUFFICIENT_OUTPUT);
    require(this.fee_bps <= MAX_FEE_BPS, ERROR_INSUFFICIENT_OUTPUT);

    let pt_in_after_fee: Int = (msg.pt_in * (10000 - this.fee_bps)) / 10000;
    require(pt_in_after_fee > 0, ERROR_INSUFFICIENT_OUTPUT);

    let asset_out: Int = (this.asset_reserve * pt_in_after_fee) / (this.pt_reserve + pt_in_after_fee);
    require(asset_out >= msg.min_asset_out, ERROR_INSUFFICIENT_OUTPUT);
    require(asset_out > 0, ERROR_INSUFFICIENT_OUTPUT);

    this.pt_reserve = this.pt_reserve + pt_in_after_fee;
    this.asset_reserve = this.asset_reserve - asset_out;

    // NOTE: token transfer plumbing is implemented later through jetton notifications.
    // For now the contract keeps deterministic reserve accounting.
  }
}

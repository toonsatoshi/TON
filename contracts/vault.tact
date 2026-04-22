import "./messages.tact";
import "./constants.tact";
import "./errors.tact";

contract Vault {
  factory: Address;
  underlying_jetton: Address;
  pt_jetton_master: Address;
  yt_jetton_master: Address;
  expiry: Int;
  yield_index_at_creation: Int;
  current_yield_index: Int;
  last_index_update: Int;
  total_pt_outstanding: Int;
  total_yt_outstanding: Int;
  is_expired: Bool;

  receive(msg: RedeemPT) {
    // TODO: verify expiry reached, burn PT, transfer underlying.
  }

  receive(msg: ClaimYield) {
    // TODO: compute claimable yield using index deltas and transfer proceeds.
  }

  receive(msg: YieldIndexUpdate) {
    self.current_yield_index = msg.new_index;
    self.last_index_update = now();
  }
}

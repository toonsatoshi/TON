import "./messages.tact";
import "./constants.tact";
import "./errors.tact";

contract MarketFactory {
  owner: Address;
  protocol_fee_bps: Int;
  fee_collector: Address;
  markets: map<Int, Address>;
  market_count: Int;
  min_expiry_delta: Int;

  receive(msg: DeployMarket) {
    // TODO:
    // 1) validate expiry >= now + min_expiry_delta
    // 2) compute deterministic market_id
    // 3) deploy vault via StateInit
    // 4) register market in map and emit event
  }

  get fun getMarket(market_id: Int): Address {
    return self.markets.get(market_id)!!;
  }
}

import "./messages.tact";

contract YieldIndexOracle {
  vault: Address;
  bemo_contract: Address;
  last_index: Int;
  last_update: Int;
  history: map<Int, Int>;
  updater_whitelist: map<Address, Bool>;

  receive(msg: UpdateYieldIndex) {
    // TODO: request Bemo rate and forward YieldIndexUpdate to vault.
  }
}

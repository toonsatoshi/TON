contract PTJettonMaster {
  vault: Address;
  total_supply: Int;
  content: Cell;
  wallet_code: Cell;
  expiry: Int;

  // TODO: add TEP-74 compatible mint/burn handlers gated by `vault`.
}

# API documentation

All endpoints return json and don't accept any parameters. Most endpoints minimally process the data coming from the
underlying Hydra websocket. If you have any additional questions please refer to the Hydra docs for details.

## /api/peers/
### Response
- peers: An object where each key is a peer ID and its value is a timestamp (ISO 8601 format).

## /api/commited
### Response
- committed: Array of committed transaction objects, each containing:
  - timestamp: Timestamp of the commitment.
  - seq: Sequence number of the commitment.
  - utxo: Object mapping UTXO identifiers to UTXO details:
    - {<transaction_id>_<index>}: Object with:
      - address: Address associated with the UTXO.
      - datum: Datum (if any).
      - datumhash: Hash of the datum (if any).
      - inline_datum: Inline datum (if any).
      - reference_script: Reference script (if any).
      - value: Object with:
        - lovelace: Amount in lovelace.
        - also contains other tokens.
  - party: Object with:
    - vkey: Verification key of the party.

## /api/transactions
### Response
- transactions: Array of transaction objects, each containing:
  - id: Unique identifier for the transaction.
  - data: Object with transaction details, including:
    - auxiliary_data: Additional data (if any).
    - body: Object with core transaction details:
      - auxiliary_data_hash: Hash of auxiliary data (if any).
      - certs: Certificates (if any).
      - collateral: Collateral information (if any).
      - collateral_return: Return amount for collateral (if any).
      - current_treasury_value: Current treasury value (if any).
      - donation: Donation amount (if any).
      - fee: Transaction fee.
      - inputs: Array of input objects with transaction_id and index.
      - mint: Minting information (if any).
      - network_id: Network identifier (if any).
      - outputs: Array of output objects with address and amount.
      - reference_inputs: Reference inputs (if any).
      - required_signers: List of required signers (if any).
      - script_data_hash: Hash of script data (if any).
      - total_collateral: Total collateral amount (if any).
      - ttl: Time to live (if any).
      - update: Update data (if any).
      - validity_start_interval: Validity start interval (if any).
      - voting_procedures: Voting procedures (if any).
      - voting_proposals: Voting proposals (if any).
      - withdrawals: Withdrawals (if any).
    - is_valid: Boolean indicating if the transaction is valid.
    - witness_set: Object with:
      - bootstraps: Bootstrap information (if any).
      - native_scripts: Native scripts (if any).
      - plutus_data: Plutus data (if any).
      - plutus_scripts: Plutus scripts (if any).
      - redeemers: Redeemers (if any).
      - vkeys: Array of witness key objects with vkey and signature.

## /api/snapshots
### Response
- snapshots: An array of snapshot objects, each containing:
    - timestamp: Snapshot time (ISO 8601 format).
    - seq: Sequence number.
    - head_id: ID of the head.
    - snapshot: Object with:
      - confirmed_transactions: Array of transaction IDs.
      - head_id: ID of the head.
      - snapshot_number: Snapshot number.
      - utxo: Object with UTXO details.
      - utxo_to_decommit: Object with details of UTXOs to be decommitted.

## /api/protocol_params
### Response
- protocol_params: Object containing various protocol parameters, including:
  - collateral_percentage: Percentage for collateral.
  - cost_models: Object with arrays for plutus_v1, plutus_v2, and plutus_v3 cost models.
  - execution_unit_prices: Object with price_memory and price_steps.
  - max_block_body_size: Maximum block body size.
  - max_block_execution_units: Object with memory and steps limits.
  - max_block_header_size: Maximum block header size.
  - max_collateral_inputs: Maximum number of collateral inputs.
  - max_tx_execution_units: Object with limits for transactions.
  - max_tx_size: Maximum transaction size.
  - max_value_size: Maximum value size.
  - min_pool_cost: Minimum cost for pools.
  - monetary_expansion: Rate of monetary expansion.
  - pool_pledge_influence: Influence of pool pledge.
  - pool_retire_max_epoch: Maximum epochs for pool retirement.
  - protocol_version: Object with major and minor version numbers.
  - stake_address_deposit: Deposit required for stake address.
  - stake_pool_deposit: Deposit for stake pool.
  - stake_pool_target_num: Target number of stake pools.
  - treasury_cut: Percentage taken from treasury.
  - tx_fee_fixed: Fixed transaction fee.
  - tx_fee_per_byte: Transaction fee per byte.
  - utxo_cost_per_byte: Cost per byte for UTXOs.

## /api/log
### Response
Returns a list containing all processed messages from the underlying Hydra websocket. For exact details refer to the
Hydra docs.

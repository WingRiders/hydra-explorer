#[rustler::nif]
fn tx_from_cbor(tx_cbor: String) -> String {
    cardano_serialization_lib::Transaction::from_hex(&tx_cbor)
        .unwrap()
        .to_json()
        .unwrap()
}

rustler::init!("Elixir.Csl");

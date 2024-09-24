defmodule Csl do
  use Rustler, otp_app: :hydra_explorer, crate: "csl"

  def tx_from_cbor(_tx_cbor_hex), do: :erlang.nif_error(:nif_not_loaded)
end

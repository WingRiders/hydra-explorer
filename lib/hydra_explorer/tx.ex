defmodule HydraExplorer.Tx do
  @doc """
  An example:

    %{
    "auxiliary_data" => nil,
    "body" => %{
      "auxiliary_data_hash" => nil,
      "certs" => nil,
      "collateral" => nil,
      "collateral_return" => nil,
      "current_treasury_value" => nil,
      "donation" => nil,
      "fee" => "0",
      "inputs" => [
        %{
          "index" => 0,
          "transaction_id" => "df0c2ee877dafa38377dcac3cb7feb45e83d08095d19cad23e07256af42b9e89"
        }
      ],
      "mint" => nil,
      "network_id" => nil,
      "outputs" => [
        %{
          "address" => "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
          "amount" => %{"coin" => "1000000", "multiasset" => nil},
          "plutus_data" => nil,
          "script_ref" => nil
        },
        %{
          "address" => "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
          "amount" => %{"coin" => "49000000", "multiasset" => nil},
          "plutus_data" => nil,
          "script_ref" => nil
        }
      ],
      "reference_inputs" => nil,
      "required_signers" => nil,
      "script_data_hash" => nil,
      "total_collateral" => nil,
      "ttl" => nil,
      "update" => nil,
      "validity_start_interval" => nil,
      "voting_procedures" => nil,
      "voting_proposals" => nil,
      "withdrawals" => nil
    },
    "is_valid" => true,
    "witness_set" => %{
      "bootstraps" => nil,
      "native_scripts" => nil,
      "plutus_data" => nil,
      "plutus_scripts" => nil,
      "redeemers" => nil,
      "vkeys" => [
        %{
          "signature" => "a9e11e1bacf7f36115c09accc1ce5d11f8e4a60d6779588aa10ebe47a67956723fa3e7114e7bf25ac856b488d538711872ec7eca864108a1bf36f440ab26d50b",
          "vkey" => "ed25519_pk1tmc7kldnxn9qe8p6z9flepa9q77jl9ntds3hwwlpjr7ur8yuel8scg76ht"
        }
      ]
    }
  }
  """
  def from_cbor(hex) when is_binary(hex) do
    Csl.tx_from_cbor(hex) |> Jason.decode!()
  end
end

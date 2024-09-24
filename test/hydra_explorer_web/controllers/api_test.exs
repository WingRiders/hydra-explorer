defmodule HydraExplorerWeb.ApiTest do
  use HydraExplorerWeb.ConnCase

  test "GET /api/protocol_params", %{conn: conn} do
    conn = get(conn, ~p"/api/protocol_params")

    assert json_response(conn, 200) == %{
             "protocol_params" => %{
               "collateral_percentage" => 150,
               "cost_models" => %{
                 "plutus_v1" => [
                   100_788,
                   420,
                   1,
                   1,
                   1000,
                   173,
                   0,
                   1,
                   1000,
                   59957,
                   4,
                   1,
                   11183,
                   32,
                   201_305,
                   8356,
                   4,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   100,
                   100,
                   16000,
                   100,
                   94375,
                   32,
                   132_994,
                   32,
                   61462,
                   4,
                   72010,
                   178,
                   0,
                   1,
                   22151,
                   32,
                   91189,
                   769,
                   4,
                   2,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   1000,
                   42921,
                   4,
                   2,
                   24548,
                   29498,
                   38,
                   1,
                   898_148,
                   27279,
                   1,
                   51775,
                   558,
                   1,
                   39184,
                   1000,
                   60594,
                   1,
                   141_895,
                   32,
                   83150,
                   32,
                   15299,
                   32,
                   76049,
                   1,
                   13169,
                   4,
                   22100,
                   10,
                   28999,
                   74,
                   1,
                   28999,
                   74,
                   1,
                   43285,
                   552,
                   1,
                   44749,
                   541,
                   1,
                   33852,
                   32,
                   68246,
                   32,
                   72362,
                   32,
                   7243,
                   32,
                   7391,
                   32,
                   11546,
                   32,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   90434,
                   519,
                   0,
                   1,
                   74433,
                   32,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   270_652,
                   22588,
                   4,
                   1_457_325,
                   64566,
                   4,
                   20467,
                   1,
                   4,
                   0,
                   141_992,
                   32,
                   100_788,
                   420,
                   1,
                   1,
                   81663,
                   32,
                   59498,
                   32,
                   20142,
                   32,
                   24588,
                   32,
                   20744,
                   32,
                   25933,
                   32,
                   24623,
                   32,
                   53_384_111,
                   14333,
                   10
                 ],
                 "plutus_v2" => [
                   100_788,
                   420,
                   1,
                   1,
                   1000,
                   173,
                   0,
                   1,
                   1000,
                   59957,
                   4,
                   1,
                   11183,
                   32,
                   201_305,
                   8356,
                   4,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   100,
                   100,
                   16000,
                   100,
                   94375,
                   32,
                   132_994,
                   32,
                   61462,
                   4,
                   72010,
                   178,
                   0,
                   1,
                   22151,
                   32,
                   91189,
                   769,
                   4,
                   2,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   1000,
                   42921,
                   4,
                   2,
                   24548,
                   29498,
                   38,
                   1,
                   898_148,
                   27279,
                   1,
                   51775,
                   558,
                   1,
                   39184,
                   1000,
                   60594,
                   1,
                   141_895,
                   32,
                   83150,
                   32,
                   15299,
                   32,
                   76049,
                   1,
                   13169,
                   4,
                   22100,
                   10,
                   28999,
                   74,
                   1,
                   28999,
                   74,
                   1,
                   43285,
                   552,
                   1,
                   44749,
                   541,
                   1,
                   33852,
                   32,
                   68246,
                   32,
                   72362,
                   32,
                   7243,
                   32,
                   7391,
                   32,
                   11546,
                   32,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   90434,
                   519,
                   0,
                   1,
                   74433,
                   32,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   85848,
                   228_465,
                   122,
                   0,
                   1,
                   1,
                   955_506,
                   213_312,
                   0,
                   2,
                   270_652,
                   22588,
                   4,
                   1_457_325,
                   64566,
                   4,
                   20467,
                   1,
                   4,
                   0,
                   141_992,
                   32,
                   100_788,
                   420,
                   1,
                   1,
                   81663,
                   32,
                   59498,
                   32,
                   20142,
                   32,
                   24588,
                   32,
                   20744,
                   32,
                   25933,
                   32,
                   24623,
                   32,
                   43_053_543,
                   10,
                   53_384_111,
                   14333,
                   10,
                   43_574_283,
                   26308,
                   10
                 ],
                 "plutus_v3" => [
                   100_788,
                   420,
                   1,
                   1,
                   1000,
                   173,
                   0,
                   1,
                   1000,
                   59957,
                   4,
                   1,
                   11183,
                   32,
                   201_305,
                   8356,
                   4,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   16000,
                   100,
                   100,
                   100,
                   16000,
                   100,
                   94375,
                   32,
                   132_994,
                   32,
                   61462,
                   4,
                   72010,
                   178,
                   0,
                   1,
                   22151,
                   32,
                   91189,
                   769,
                   4,
                   2,
                   85848,
                   123_203,
                   7305,
                   -900,
                   1716,
                   549,
                   57,
                   85848,
                   0,
                   1,
                   1,
                   1000,
                   42921,
                   4,
                   2,
                   24548,
                   29498,
                   38,
                   1,
                   898_148,
                   27279,
                   1,
                   51775,
                   558,
                   1,
                   39184,
                   1000,
                   60594,
                   1,
                   141_895,
                   32,
                   83150,
                   32,
                   15299,
                   32,
                   76049,
                   1,
                   13169,
                   4,
                   22100,
                   10,
                   28999,
                   74,
                   1,
                   28999,
                   74,
                   1,
                   43285,
                   552,
                   1,
                   44749,
                   541,
                   1,
                   33852,
                   32,
                   68246,
                   32,
                   72362,
                   32,
                   7243,
                   32,
                   7391,
                   32,
                   11546,
                   32,
                   85848,
                   123_203,
                   7305,
                   -900,
                   1716,
                   549,
                   57,
                   85848,
                   0,
                   1,
                   90434,
                   519,
                   0,
                   1,
                   74433,
                   32,
                   85848,
                   123_203,
                   7305,
                   -900,
                   1716,
                   549,
                   57,
                   85848,
                   0,
                   1,
                   1,
                   85848,
                   123_203,
                   7305,
                   -900,
                   1716,
                   549,
                   57,
                   85848,
                   0,
                   1,
                   955_506,
                   213_312,
                   0,
                   2,
                   270_652,
                   22588,
                   4,
                   1_457_325,
                   64566,
                   4,
                   20467,
                   1,
                   4,
                   0,
                   141_992,
                   32,
                   100_788,
                   420,
                   1,
                   1,
                   81663,
                   32,
                   59498,
                   32,
                   20142,
                   32,
                   24588,
                   32,
                   20744,
                   32,
                   25933,
                   32,
                   24623,
                   32,
                   43_053_543,
                   10,
                   53_384_111,
                   14333,
                   10,
                   43_574_283,
                   26308,
                   10,
                   16000,
                   100,
                   16000,
                   100,
                   962_335,
                   18,
                   2_780_678,
                   6,
                   442_008,
                   1,
                   52_538_055,
                   3756,
                   18,
                   267_929,
                   18,
                   76_433_006,
                   8868,
                   18,
                   52_948_122,
                   18,
                   1_995_836,
                   36,
                   3_227_919,
                   12,
                   901_022,
                   1,
                   166_917_843,
                   4307,
                   36,
                   284_546,
                   36,
                   158_221_314,
                   26549,
                   36,
                   74_698_472,
                   36,
                   333_849_714,
                   1,
                   254_006_273,
                   72,
                   2_174_038,
                   72,
                   2_261_318,
                   64571,
                   4,
                   207_616,
                   8310,
                   4,
                   1_293_828,
                   28716,
                   63,
                   0,
                   1,
                   1_006_041,
                   43623,
                   251,
                   0,
                   1
                 ]
               },
               "execution_unit_prices" => %{"price_memory" => 0, "price_steps" => 0},
               "max_block_body_size" => 90112,
               "max_block_execution_units" => %{
                 "memory" => 62_000_000,
                 "steps" => 20_000_000_000
               },
               "max_block_header_size" => 1100,
               "max_collateral_inputs" => 3,
               "max_tx_execution_units" => %{"memory" => 14_000_000, "steps" => 10_000_000_000},
               "max_tx_size" => 16384,
               "max_value_size" => 5000,
               "min_pool_cost" => 170_000_000,
               "monetary_expansion" => 0.003,
               "pool_pledge_influence" => 0.3,
               "pool_retire_max_epoch" => 18,
               "protocol_version" => %{"major" => 9, "minor" => 0},
               "stake_address_deposit" => 2_000_000,
               "stake_pool_deposit" => 500_000_000,
               "stake_pool_target_num" => 500,
               "treasury_cut" => 0.2,
               "tx_fee_fixed" => 0,
               "tx_fee_per_byte" => 0,
               "utxo_cost_per_byte" => 4310
             }
           }
  end

  test "GET /api/peers", %{conn: conn} do
    conn = get(conn, ~p"/api/peers")

    assert json_response(conn, 200) == %{
             "peers" => %{"bob-node" => "2024-09-09T07:29:02.777571Z"}
           }
  end

  test "GET /api/snapshots", %{conn: conn} do
    conn = get(conn, ~p"/api/snapshots")

    assert json_response(conn, 200) == %{
             "snapshots" => [
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 6,
                 "snapshot" => %{
                   "confirmed_transactions" => [
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05"
                   ],
                   "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                   "snapshot_number" => 1,
                   "utxo" => %{
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 1_000_000}
                     },
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_1" => %{
                       "address" =>
                         "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 49_000_000}
                     },
                     "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 30_000_000}
                     }
                   },
                   "utxo_to_decommit" => nil,
                   "version" => 0
                 },
                 "timestamp" => "2024-09-09T07:34:37.169422Z"
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 10,
                 "snapshot" => %{
                   "confirmed_transactions" => [],
                   "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                   "snapshot_number" => 2,
                   "utxo" => %{
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 1_000_000}
                     },
                     "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 30_000_000}
                     }
                   },
                   "utxo_to_decommit" => %{
                     "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e_0" => %{
                       "address" =>
                         "addr_test1vp5cxztpc6hep9ds7fjgmle3l225tk8ske3rmwr9adu0m6qchmx5z",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 49_000_000}
                     }
                   },
                   "version" => 0
                 },
                 "timestamp" => "2024-09-11T13:40:51.029540Z"
               }
             ]
           }
  end

  test "GET /api/transactions", %{conn: conn} do
    conn = get(conn, ~p"/api/transactions")

    assert json_response(conn, 200) == %{
             "transactions" => [
               %{
                 "data" => %{
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
                         "transaction_id" =>
                           "df0c2ee877dafa38377dcac3cb7feb45e83d08095d19cad23e07256af42b9e89"
                       }
                     ],
                     "mint" => nil,
                     "network_id" => nil,
                     "outputs" => [
                       %{
                         "address" =>
                           "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                         "amount" => %{"coin" => "1000000", "multiasset" => nil},
                         "plutus_data" => nil,
                         "script_ref" => nil
                       },
                       %{
                         "address" =>
                           "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
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
                         "signature" =>
                           "a9e11e1bacf7f36115c09accc1ce5d11f8e4a60d6779588aa10ebe47a67956723fa3e7114e7bf25ac856b488d538711872ec7eca864108a1bf36f440ab26d50b",
                         "vkey" =>
                           "ed25519_pk1tmc7kldnxn9qe8p6z9flepa9q77jl9ntds3hwwlpjr7ur8yuel8scg76ht"
                       }
                     ]
                   }
                 },
                 "id" => "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05"
               }
             ]
           }
  end

  test "GET /api/committed", %{conn: conn} do
    conn = get(conn, ~p"/api/committed")

    assert json_response(conn, 200) == %{
             "committed" => [
               %{
                 "party" => %{
                   "vkey" => "cec788a6f18766d466ce5bb11f0211292d13b01686f541fbdc6c1e8d465a36b4"
                 },
                 "seq" => 2,
                 "timestamp" => "2024-09-09T07:32:31.250056Z",
                 "utxo" => %{
                   "df0c2ee877dafa38377dcac3cb7feb45e83d08095d19cad23e07256af42b9e89_0" => %{
                     "address" =>
                       "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 50_000_000}
                   }
                 }
               },
               %{
                 "party" => %{
                   "vkey" => "86a5af4d198127091fe95234a9921c9e9424a603a45c4cb78bb8b2ea57883041"
                 },
                 "seq" => 3,
                 "timestamp" => "2024-09-09T07:32:39.218629Z",
                 "utxo" => %{
                   "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 30_000_000}
                   }
                 }
               }
             ]
           }
  end

  test "GET /api/log", %{conn: conn} do
    conn = get(conn, ~p"/api/log")

    assert json_response(conn, 200) == %{
             "messages" => [
               %{
                 "peer" => "bob-node",
                 "seq" => 0,
                 "timestamp" => "2024-09-09T07:29:02.777571Z",
                 "type" => "PeerConnected"
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "parties" => [
                   %{
                     "vkey" => "cec788a6f18766d466ce5bb11f0211292d13b01686f541fbdc6c1e8d465a36b4"
                   },
                   %{"vkey" => "86a5af4d198127091fe95234a9921c9e9424a603a45c4cb78bb8b2ea57883041"}
                 ],
                 "seq" => 1,
                 "timestamp" => "2024-09-09T07:30:53.508414Z",
                 "type" => "HeadIsInitializing"
               },
               %{
                 "party" => %{
                   "vkey" => "cec788a6f18766d466ce5bb11f0211292d13b01686f541fbdc6c1e8d465a36b4"
                 },
                 "seq" => 2,
                 "timestamp" => "2024-09-09T07:32:31.250056Z",
                 "type" => "Committed",
                 "utxo" => %{
                   "df0c2ee877dafa38377dcac3cb7feb45e83d08095d19cad23e07256af42b9e89_0" => %{
                     "address" =>
                       "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 50_000_000}
                   }
                 }
               },
               %{
                 "party" => %{
                   "vkey" => "86a5af4d198127091fe95234a9921c9e9424a603a45c4cb78bb8b2ea57883041"
                 },
                 "seq" => 3,
                 "timestamp" => "2024-09-09T07:32:39.218629Z",
                 "type" => "Committed",
                 "utxo" => %{
                   "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 30_000_000}
                   }
                 }
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 4,
                 "timestamp" => "2024-09-09T07:32:52.190123Z",
                 "type" => "HeadIsOpen",
                 "utxo" => %{
                   "df0c2ee877dafa38377dcac3cb7feb45e83d08095d19cad23e07256af42b9e89_0" => %{
                     "address" =>
                       "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 50_000_000}
                   },
                   "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 30_000_000}
                   }
                 }
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 5,
                 "timestamp" => "2024-09-09T07:34:37.166543Z",
                 "transaction" => %{
                   "cbor_hex" =>
                     "84a30081825820df0c2ee877dafa38377dcac3cb7feb45e83d08095d19cad23e07256af42b9e8900018282581d604ab8c2c1d5eb6a303135d01b4ff2890e7c2b6bc85b63e0f53bba34731a000f424082581d60b51fc8095fa295eb58de39fe483753f91f2cc0589a978682e7f829831a02ebae400200a100818258205ef1eb7db334ca0c9c3a1153fc87a507bd2f966b6c23773be190fdc19c9ccfcf5840a9e11e1bacf7f36115c09accc1ce5d11f8e4a60d6779588aa10ebe47a67956723fa3e7114e7bf25ac856b488d538711872ec7eca864108a1bf36f440ab26d50bf5f6",
                   "description" => "",
                   "tx_id" => "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05",
                   "type" => "Witnessed Tx BabbageEra"
                 },
                 "type" => "TxValid"
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 6,
                 "snapshot" => %{
                   "confirmed_transactions" => [
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05"
                   ],
                   "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                   "snapshot_number" => 1,
                   "utxo" => %{
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 1_000_000}
                     },
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_1" => %{
                       "address" =>
                         "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 49_000_000}
                     },
                     "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 30_000_000}
                     }
                   },
                   "utxo_to_decommit" => nil,
                   "version" => 0
                 },
                 "timestamp" => "2024-09-09T07:34:37.169422Z",
                 "type" => "SnapshotConfirmed"
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 7,
                 "timestamp" => "2024-09-09T08:15:20.444702Z",
                 "transaction" => %{
                   "cbor_hex" =>
                     "84a30081825820739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d0501018282581d604ab8c2c1d5eb6a303135d01b4ff2890e7c2b6bc85b63e0f53bba347319132482581d60b51fc8095fa295eb58de39fe483753f91f2cc0589a978682e7f829831a02eb9b1c0200a100818258205ef1eb7db334ca0c9c3a1153fc87a507bd2f966b6c23773be190fdc19c9ccfcf5840ce1c5417bacc2d3c3abebf79073666c7492c480a438a0663beb95a8ae258c1304b5893d90639b790b5aa29d92846a1d59f4b62a8a17b652952766b2d57c56302f5f6",
                   "description" => "",
                   "tx_id" => "85038934551397e2366f151d556aecfff7fd5dba6d9d436351230073177ba819",
                   "type" => "Witnessed Tx BabbageEra"
                 },
                 "type" => "TxInvalid",
                 "utxo" => %{
                   "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 1_000_000}
                   },
                   "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_1" => %{
                     "address" =>
                       "addr_test1vz63ljqft73ft66cmculujph20u37txqtzdf0p5zuluznqcgnykep",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 49_000_000}
                   },
                   "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 30_000_000}
                   }
                 },
                 "validation_error" => %{
                   "reason" =>
                     "ApplyTxError (UtxowFailure (UtxoFailure (BabbageOutputTooSmallUTxO [((Addr Testnet (KeyHashObj (KeyHash {unKeyHash = \"4ab8c2c1d5eb6a303135d01b4ff2890e7c2b6bc85b63e0f53bba3473\"})) StakeRefNull,MaryValue (Coin 4900) (MultiAsset (fromList [])),NoDatum,SNothing),Coin 840450)])) :| [])"
                 }
               },
               %{
                 "peer" => "bob-node",
                 "seq" => 8,
                 "timestamp" => "2024-09-11T06:01:46.963377Z",
                 "type" => "PeerConnected"
               },
               %{
                 "decommit_tx" => %{
                   "cbor_hex" =>
                     "84a30081825820739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d0501018182581d6069830961c6af9095b0f2648dff31fa9545d8f0b6623db865eb78fde81a02ebae400200a100818258205ef1eb7db334ca0c9c3a1153fc87a507bd2f966b6c23773be190fdc19c9ccfcf58400419a2e53b65281f909fd57b2b33968af8a4788e0abf9136c55b735182e9dd8b8bfc54ebb8bf054d688616c6a3918d3c7f2f1f426262df205dec423fe3e0c105f5f6",
                   "description" => "",
                   "tx_id" => "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e",
                   "type" => "Witnessed Tx BabbageEra"
                 },
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 9,
                 "timestamp" => "2024-09-11T13:40:51.026340Z",
                 "type" => "DecommitRequested",
                 "utxo_to_decommit" => %{
                   "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e_0" => %{
                     "address" =>
                       "addr_test1vp5cxztpc6hep9ds7fjgmle3l225tk8ske3rmwr9adu0m6qchmx5z",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 49_000_000}
                   }
                 }
               },
               %{
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 10,
                 "snapshot" => %{
                   "confirmed_transactions" => [],
                   "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                   "snapshot_number" => 2,
                   "utxo" => %{
                     "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 1_000_000}
                     },
                     "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                       "address" =>
                         "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 30_000_000}
                     }
                   },
                   "utxo_to_decommit" => %{
                     "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e_0" => %{
                       "address" =>
                         "addr_test1vp5cxztpc6hep9ds7fjgmle3l225tk8ske3rmwr9adu0m6qchmx5z",
                       "datum" => nil,
                       "datumhash" => nil,
                       "inline_datum" => nil,
                       "reference_script" => nil,
                       "value" => %{"lovelace" => 49_000_000}
                     }
                   },
                   "version" => 0
                 },
                 "timestamp" => "2024-09-11T13:40:51.029540Z",
                 "type" => "SnapshotConfirmed"
               },
               %{
                 "decommit_tx_id" =>
                   "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e",
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 11,
                 "timestamp" => "2024-09-11T13:40:51.029610Z",
                 "type" => "DecommitApproved",
                 "utxo_to_decommit" => %{
                   "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e_0" => %{
                     "address" =>
                       "addr_test1vp5cxztpc6hep9ds7fjgmle3l225tk8ske3rmwr9adu0m6qchmx5z",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 49_000_000}
                   }
                 }
               },
               %{
                 "post_chain_tx" => %{
                   "decrementing_snapshot" => %{
                     "signatures" => %{
                       "multi_signature" => [
                         "97cfe12d5e27bd4c2ea16985f6443f58622764ce7e54b92c90325002d66c8e5463c03308de365d3704e032c15183d74b386f1ca133a169cf91f89ed2c841a904",
                         "764091acd370f5ab65eff381ce9138602d412381b264f09c9b390878408bc8b6c629da46282435408b57e9215dd49f972b8595034ee28a6fcc95e3972024100f"
                       ]
                     },
                     "snapshot" => %{
                       "confirmed_transactions" => [],
                       "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                       "snapshot_number" => 2,
                       "utxo" => %{
                         "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" =>
                           %{
                             "address" =>
                               "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                             "datum" => nil,
                             "datumhash" => nil,
                             "inline_datum" => nil,
                             "reference_script" => nil,
                             "value" => %{"lovelace" => 1_000_000}
                           },
                         "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" =>
                           %{
                             "address" =>
                               "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                             "datum" => nil,
                             "datumhash" => nil,
                             "inline_datum" => nil,
                             "reference_script" => nil,
                             "value" => %{"lovelace" => 30_000_000}
                           }
                       },
                       "utxo_to_decommit" => %{
                         "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e_0" =>
                           %{
                             "address" =>
                               "addr_test1vp5cxztpc6hep9ds7fjgmle3l225tk8ske3rmwr9adu0m6qchmx5z",
                             "datum" => nil,
                             "datumhash" => nil,
                             "inline_datum" => nil,
                             "reference_script" => nil,
                             "value" => %{"lovelace" => 49_000_000}
                           }
                       },
                       "version" => 0
                     },
                     "tag" => "ConfirmedSnapshot"
                   },
                   "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                   "head_parameters" => %{
                     "contestation_period" => 60,
                     "parties" => [
                       %{
                         "vkey" =>
                           "cec788a6f18766d466ce5bb11f0211292d13b01686f541fbdc6c1e8d465a36b4"
                       },
                       %{
                         "vkey" =>
                           "86a5af4d198127091fe95234a9921c9e9424a603a45c4cb78bb8b2ea57883041"
                       }
                     ]
                   },
                   "tag" => "DecrementTx"
                 },
                 "post_tx_error" => %{
                   "failure_reason" =>
                     "TxValidationErrorInCardanoMode (ShelleyTxValidationError ShelleyBasedEraConway (ApplyTxError (ConwayUtxowFailure (ExtraRedeemers [ConwaySpending (AsIx {unAsIx = 0})]) :| [ConwayUtxowFailure (PPViewHashesDontMatch (SJust (SafeHash \"78c0e598d43a9308dde184cc93856fb5e79bdcf691aa5ecc7c30971a45ea43c5\")) (SJust (SafeHash \"025073d400702a3b46e625d8d19865d57942328a9913d563dafa90c08cd80f7e\"))),ConwayUtxowFailure (UtxoFailure (ValueNotConservedUTxO (MaryValue (Coin 20025232) (MultiAsset (fromList []))) (MaryValue (Coin 104361092) (MultiAsset (fromList [(PolicyID {policyID = ScriptHash \"848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5\"},fromList [(\"4879647261486561645631\",1),(\"49745e6862b139316bd80a81b82c1290cf14fd1669522fe1afefee0b\",1),(\"b91303b668a32757d369b365a2c2f1108aad09307c12b34195e8c84f\",1)])]))))),ConwayUtxowFailure (UtxoFailure (BadInputsUTxO (fromList [TxIn (TxId {unTxId = SafeHash \"1623e08f7e436d997ea428d7a75abe3bdfe45f460b5a87b84987d9c7673588ac\"}) (TxIx {unTxIx = 0})])))])))",
                   "tag" => "FailedToPostTx"
                 },
                 "seq" => 12,
                 "timestamp" => "2024-09-11T13:40:52.063994Z",
                 "type" => "PostTxOnChainFailed"
               },
               %{
                 "decommit_tx_id" =>
                   "600bd0447076b2be83494572e014df87f7fce6396d4eb67bb2f460fc6f74a72e",
                 "head_id" => "848ba2ed289fb1218177d71cab421e9dbc38e53e202fa4d44e68e4f5",
                 "seq" => 13,
                 "timestamp" => "2024-09-11T13:42:08.361810Z",
                 "type" => "DecommitFinalized"
               },
               %{
                 "peer" => "bob-node",
                 "seq" => 14,
                 "timestamp" => "2024-09-12T06:36:43.434245Z",
                 "type" => "PeerConnected"
               },
               %{
                 "head_status" => "Open",
                 "hydra_node_version" => "0.18.1-8d8d3a3662f0e3cb677b31071976c9b6ecae3f1d",
                 "me" => %{
                   "vkey" => "cec788a6f18766d466ce5bb11f0211292d13b01686f541fbdc6c1e8d465a36b4"
                 },
                 "snapshot_utxo" => %{
                   "739fd81952b8ba75c3885f6f8bdf3ce1c49eee34030a8d18c1a90978497b5d05_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 1_000_000}
                   },
                   "fe415295ec1398dbc8f93c2142b81ff6470c0bb1397033c144c6cd145433bc4b_0" => %{
                     "address" =>
                       "addr_test1vp9t3skp6h4k5vp3xhgpknlj3y88c2mtepdk8c848wargucssa5fh",
                     "datum" => nil,
                     "datumhash" => nil,
                     "inline_datum" => nil,
                     "reference_script" => nil,
                     "value" => %{"lovelace" => 30_000_000}
                   }
                 },
                 "timestamp" => "2024-09-12T13:30:00.032125Z",
                 "type" => "Greetings"
               }
             ]
           }
  end
end

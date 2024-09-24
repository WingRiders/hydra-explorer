# HydraExplorer

Parses and presents data from a hydra node.

## Running the hydra node
TODO: setup
In terminal 1:
* cd tmp
* source .env && cardano-node run --config config.json --topology topology.json --socket-path ./node.socket --database-path db

TODO: this
In terminal 2:
* cd tmp
* source .env
* hydra_version=0.18.1
* hydra-node \
  --node-id "alice-node" \
  --persistence-dir persistence-alice \
  --cardano-signing-key credentials/alice-node.sk \
  --hydra-signing-key credentials/alice-hydra.sk \
  --hydra-scripts-tx-id 976b28bc716490fbaa4e17d7bf33b04f27fcfafef58c436c4f2644adeeb48829 \
  --ledger-protocol-parameters protocol-parameters.json \
  --testnet-magic 1 \
  --node-socket node.socket \
  --api-port 4001 \
  --host 0.0.0.0 \
  --api-host 0.0.0.0 \
  --port 5001 \
  --peer 127.0.0.1:5002 \
  --hydra-verification-key credentials/bob-hydra.vk \
  --cardano-verification-key credentials/bob-node.vk


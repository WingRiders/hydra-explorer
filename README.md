# HydraExplorer

Parses and presents data from a hydra node. Also exposes an API endpoint to query the message log.

## Running the hydra node
https://hydra.family/head-protocol/unstable/docs/tutorial/

## Messages API
https://hydra.family/head-protocol/unstable/api-reference

## Code structure
This repo provides an Elixir/Phoenix backend with a LiveView frontend. It uses sqlite3 as a database, but messages
aren't currently persisted automatically.

We have a few files that deal with the Hydra websocket connection and data extraction
* lib/hydra_explorer/head.ex is a GenServer responsible for the websocket connection with the Hydra node; it decodes
  messages and pushes them to the message store
* lib/hydra_explorer/message_store.ex is a GenServer that stores and broadcasts the Hydra messages to the hydra_head
  queue
* lib/hydra_explorer/protocol_params.ex in an Agent that fetches and exposes the protocol parameters of the Hydra node
* lib/hydra_explorer/tx.ex, lib/csl.ex are used to parse the tx cbor into a usable format, we're using rust's cardano
  serialization library for this, the actual rust code is in the native/csl submodule

The following files prepare the data for the FE and manipulate websocket connections with the FE client:
* lib/hydra_explorer_web/router.ex for the routes definition
* lib/hydra_explorer_web/controllers/messages.ex for the message log API
* lib/hydra_explorer_web/components/layout/app.html.heex for the navigation bar
* lib/hydra_explorer_web/components/explorer_componenst.ex for some common component templates
* lib/hydra_explorer_web/live/log.{ex, html.heex} for the whole websocket log
* lib/hydra_explorer_web/live/peers.{ex, html.heex} for the connected peers
* lib/hydra_explorer_web/live/snapshots.{ex, html.heex} for the processed snapshots
* lib/hydra_explorer_web/live/transactions.{ex, html.heex} for the valid transactions
* lib/hydra_explorer_web/live/protocol_params.{ex, html.heex} for the Hydra network parameters

It seems we don't get any blocks data from the Hydra node, which means we can only show transactions in isolation.

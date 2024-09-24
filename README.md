# HydraExplorer

Parses and presents data from a hydra node. Also exposes an API endpoint to query the message log.

## Running without a hydra node
It's possible to run the application in a dry mode without an underlying hydra node connection. That might be useful to
test the application out. To do that copy the seed database into the place of the actual one and set a DRY_RUN env
variable:
```sh
cp priv/repo/seeds.dev.sqlite3 priv/repo/dev.sqlite3
cp priv/repo/seeds.dev.sqlite3-shm priv/repo/dev.sqlite3-shm
cp priv/repo/seeds.dev.sqlite3-wal priv/repo/dev.sqlite3-wal
mix deps.get
DRY_RUN=t mix phx.server
```
Navigate to http://localhost:4000/log

## Running a hydra node
Get a hydra node up and running:
https://hydra.family/head-protocol/unstable/docs/tutorial/
After that run the application:
```
mix deps.get
mix phx.server
```
Navigate to http://localhost:4000/log

## Running tests
```sh
mix deps.get
mix test
```
All the exposed API endpoint are tested against a golden test database.

## Hydra Node API
https://hydra.family/head-protocol/unstable/api-reference

The Hydra node exposes a few http endpoints and a websocket connection. The only http endpoint that exposes data useful
for presentation purposes is the /protocol-parameters that exposes the protocol parameters the Hydra node was
configured with. Unfortunately, nothing useful for querying aside from the protocol parameters is exposed via the http
api, so to get the actual data out developers would need to establish a websocket connection and do the aggregation
themselves.

In particular, the exposed protocol parameters are:
- collateral percentage
- execution unit prices
- max block sizes
- max block execution units
- max tx execution units
- max tx size
- utxo cost per byte
- cost models
- max collateral inputs
- min pool cost
- monetary expansion
- pool pledge influence
- pool retire max epoch
- stake address deposit
- stake pool deposit
- stake pool target number
- treasury cut
- tx fee fixed
- tx fee per byte
- protocol version

We expose them via the lib/hydra_explorer/protocol_params.ex module.

The websocket in the main source of data for the explorer, it sends new frames with the message each time an event
happens. The following messages tags are available:
- Greetings
- PeerConnected
- PeerDisconnected
- PeerHandshakeFailure
- HeadIsInitializing
- Committed
- HeadIsOpen
- HeadIsClosed
- HeadIsContested
- ReadyToFanout
- HeadIsAborted
- HeadIsFinalized
- TxValid
- TxInvalid
- SnapshotConfirmed
- GetUTxOResponse
- InvalidInput
- PostTxOnChainFailed
- CommandFailed
- IgnoredHeadInitializing
- DecommitInvalid
- DecommitRequested
- DecommitApproved
- DecommitFinalized

Each one of them may carry some useful data, the parsing of those is located in the lib/hydra_explorer/message.ex
module. The exact exposed data is partially documented in the Hydra docs. Only the documented fields are parsed out and
exposed. The most important exposed parts are committed utxos, valid transactions and connected peers. More messages can
be handled and exposed separately once enough community feedback is collected on the actual needs of developers.

The most important parts are exposed with dedicated pages that follow the conventional blockchain explorer UI where
possible. The whole log is always available on the /log page. The following pages present the important aggregated data:
- /transactions - for all valid transactions
- /committed - for all utxos committed to the hydra node
- /peers - for all currently connected peers
- /snapshots - for all valid snapshots
- /protocol_params - for the protocol parameters of the hydra node
- /log - for the raw log

This application exposes an http API with access to the same data that is available in the UI:
- /api/transactions - for all valid transactions
- /api/committed - for all utxos committed to the hydra node
- /api/peers - for all currently connected peers
- /api/snapshots - for all valid snapshots
- /api/protocol_params - for the protocol parameters of the hydra node
- /api/log - for the raw log

The hydra node replays the whole websocket log on connection by default, so the explorer can avoid storing anything in a
database. During the lifetime of the hydra node different actions can happen, each one of those generates a
corresponding websocket frame that is sent to the explorer. This application collects and processes them on the fly and
presents the data through a convenient UI. The only thing that needs to be processed differently is the protocol
parameters. They are fetched from the node's http endpoint on startup and cached for the lifetime of the explorer.

## Code structure
This repo provides an Elixir/Phoenix backend with a LiveView frontend. It uses sqlite3 as a database, but messages
aren't persisted automatically. The main purpose of the database is to load data for tests/dry-runs.

This choice of technologies allows for a straightforward implementation that streams the new messages, and that allows
for nearly instantaneous display of the events on the node.

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
* lib/hydra_explorer_web/components/explorer_components.ex for some common component templates
* lib/hydra_explorer_web/live/log.{ex, html.heex} for the whole websocket log
* lib/hydra_explorer_web/live/peers.{ex, html.heex} for the connected peers
* lib/hydra_explorer_web/live/snapshots.{ex, html.heex} for the processed snapshots
* lib/hydra_explorer_web/live/transactions.{ex, html.heex} for the valid transactions
* lib/hydra_explorer_web/live/protocol_params.{ex, html.heex} for the Hydra network parameters

As we don't get any blocks data from the Hydra node, we can only show transactions in isolation.

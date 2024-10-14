# Hydra Explorer

## Table of Contents

- [Introduction](#introduction)  
  An overview of the project, outlining the problems it addresses, the current inconveniences in the current system, and how this tool supports the developers.

- [Running a Hydra Node](#running-a-hydra-node)  
  Steps to set up and operate a Hydra node.

- [Running the application](#running-the-application)  
  Commands to start the Hydra Explorer project.

- [Running without a Hydra Node](#running-without-a-hydra-node)  
  In case, you want to test out the application, a dry-run mode is available. Commands to set it up are in this section.

- [Running Tests](#running-tests)  
  Commands for running the Hydra Explorer tests.

- [Hydra Node API](#hydra-node-api)  
  A breakdown of Hydra endpoints and events and a description of the API endpoints provided by this project. Also, provides a list of scenarios that may happen inside a Hydra Head and how currently developers have to view the scenarios happening inside a Hydra Head.

- [Code Structure](#code-structure)  
  An overview of the project's codebase, including key components and directories with descriptions.

- [Hydra Head Architecture](HydraArchitecture.md)  
  If you are interested in knowing more about Hydra and its architecture, you can navigate to the `HydraArchitecture.md` file.

## Introduction

Hydra Explorer is an open-source tool that parses and presents data from a Hydra node, offering a web-based interface and an API. Developers often face challenges with Hydra Heads because the raw log data is unstructured, there aren't visualization tools, and debugging can get complicated.

Take a look at the screenshot below (see Figure 1) to see what a typical log output from a Hydra node looks like. The log appears as a continuous stream of text, showing events in the order they happen. While it includes all the necessary information, it's hard to interpret quickly. Developers have to navigate through the logs to find important events, like transaction commitments, state changes, transaction errors, etc., which can be time-consuming and error-prone.

Hydra Explorer solves this problem by offering a clean, user-friendly dashboard that visualizes Hydra Head events in real-time. This visual representation makes it much easier for users to track what's happening in the Hydra Head compared to manually parsing through raw logs. With a more intuitive display, developers can quickly see the system's state, reducing the effort needed to interpret text-based outputs and speeding up their workflow.

![Simple Hydra Log Showcase](./img/hydra.png)

From a debugging standpoint, the issues with raw log data become even more obvious. Logs usually show every event in a straight, unstructured way, without highlighting the most important details. This makes it tough to quickly understand the system's current state or follow the sequence of events that led to a specific outcome. Plus, logs can be long and cluttered, requiring a lot of effort to sift through them and get the bigger picture.

Hydra Explorer makes this process much easier by organizing the logs and presenting the relevant data visually. This allows developers to quickly get an overview of the system's state and monitor events in a more efficient way. As a result, it cuts down the time spent digging through long log files and makes it easier to understand and interact with the Hydra Head.

## Running a Hydra node

To be able to explore the state of your Hydra Head, the Hydra nodes need to be running. A detailed description how to set up the nodes and open a Hydra Head can be found here:
https://hydra.family/head-protocol/unstable/docs/tutorial/

## Running the application

After you have succesfully set up your Hydra nodes, you can now run the application using:

```
mix deps.get
mix phx.server
```

Navigate to http://localhost:4000/log

## Running without a Hydra node

It's possible to run the application in a dry mode without an underlying Hydra node connection. That might be useful to
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

The WebSocket is the main source of data for the explorer. It sends new frames with messages each time an event happens inside the Hydra Head. These events represent different scenarios, such as initializing the Hydra Head, committing or decommitting from it, and more. Normally, developers have to connect to the WebSocket to obtain text output related to these scenarios and parse the data themselves to extract relevant information for viewing the scenarios they are interested in. Hydra Explorer eliminates this additional complexity by handling the connection, parsing the data, and presenting it in a user-friendly, nicely formatted Web UI. The following message tags are available:

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

- `/transactions` - for all valid transactions
- `/committed` - for all utxos committed to the Hydra node
- `/peers` - for all currently connected peers
- `/snapshots` - for all valid snapshots
- `/protocol_params` - for the protocol parameters of the Hydra node
- `/log` - for the raw log

This application exposes an http API with access to the same data that is available in the UI:

- `/api/transactions` - for all valid transactions
- `/api/committed` - for all utxos committed to the Hydra node
- `/api/peers` - for all currently connected peers
- `/api/snapshots` - for all valid snapshots
- `/api/protocol_params` - for the protocol parameters of the Hydra node
- `/api/log` - for the raw log

The Hydra node replays the whole websocket log on connection by default, so the explorer can avoid storing anything in a
database. During the lifetime of the Hydra node different actions can happen, each one of those generates a
corresponding websocket frame that is sent to the explorer. This application collects and processes them on the fly and
presents the data through a convenient UI. The only thing that needs to be processed differently is the protocol
parameters. They are fetched from the node's http endpoint on startup and cached for the lifetime of the explorer.

## Code structure

This repo provides an Elixir/Phoenix backend with a LiveView frontend. It uses sqlite3 as a database, but messages
aren't persisted automatically. The main purpose of the database is to load data for tests/dry-runs.

This choice of technologies allows for a straightforward implementation that streams the new messages, and that allows
for nearly instantaneous display of the events on the node.

We have a few files that deal with the Hydra websocket connection and data extraction

- `lib/hydra_explorer/head.ex` is a GenServer responsible for the websocket connection with the Hydra node; it decodes
  messages and pushes them to the message store
- `lib/hydra_explorer/message_store.ex` is a GenServer that stores and broadcasts the Hydra messages to the hydra_head
  queue
- `lib/hydra_explorer/protocol_params.ex` in an Agent that fetches and exposes the protocol parameters of the Hydra node
- `lib/hydra_explorer/tx.ex`, `lib/csl.ex` are used to parse the tx cbor into a usable format, we're using rust's cardano
  serialization library for this, the actual rust code is in the native/csl submodule

The following files prepare the data for the FE and manipulate websocket connections with the FE client:

- `lib/hydra_explorer_web/router.ex` for the routes definition
- `lib/hydra_explorer_web/controllers/messages.ex` for the message log API
- `lib/hydra_explorer_web/components/layout/app.html.heex` for the navigation bar
- `lib/hydra_explorer_web/components/explorer_components.ex` for some common component templates
- `lib/hydra_explorer_web/live/log.{ex, html.heex}` for the whole websocket log
- `lib/hydra_explorer_web/live/peers.{ex, html.heex}` for the connected peers
- `lib/hydra_explorer_web/live/snapshots.{ex, html.heex}` for the processed snapshots
- `lib/hydra_explorer_web/live/transactions.{ex, html.heex}` for the valid transactions
- `lib/hydra_explorer_web/live/protocol_params.{ex, html.heex}` for the Hydra network parameters

As we don't get any blocks data from the Hydra node, we can only show transactions in isolation.

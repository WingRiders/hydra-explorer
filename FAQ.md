# FAQ

## What is Hydra Explorer and why should I use it?
Hydra Explorer is web-based tool designed to help developers working with Hydra nodes. It simplifies the process of
monitoring and debugging Hydra Heads by providing a user-friendly interface that visually represents key events and
data. Instead of manually parsing through Hydra node logs, which can be complex and unstructured, Hydra Explorer
organizes this information, making it faster and easier to interpret.

## What challenges does Hydra Explorer address?
The underlying Hydra websocket exposes unstructured raw text logs coming from the Hydra websocket without any grouping
nor future access once the messages were sent. With Hydra explorer, it is possible to quickly inspect particular
interesting events with sensible presentation, track transactions, and understand system states through an intuitive
dashboard, saving time and effort.

## Do I need a running Hydra node to use Hydra Explorer?
While Hydra Explorer is primarily designed to work with a live Hydra node, there is a dry-run mode available that allows
you to test the application without an active Hydra node. This mode uses a seed database to simulate Hydra Head events,
making it useful for testing the application’s functionality without needing a full Hydra setup.

## How do I set up a Hydra node?
Please refer to the official Hydra documentation for that: https://hydra.family/head-protocol/unstable/docs/tutorial/

Once the node is configured and running, you can use Hydra explorer to monitor and visualize its state.

## How does Hydra Explorer handle data from the Hydra node?
Hydera Explorer connects to the Hydra node via a WebSocket, allowing it to receive real-time events as they occur. These
events are parsed and displayed on the dashboard, showing things like valid transactions, committed UTXOs, connected
peers, snapshots, and protocol parameters. Hydra Explorer doesn’t persist log data by default, but it caches protocol
parameters for the duration of the session.

## What kind of data does Hydra Explorer display?
Hydra Explorer displays a variety of data, including:
- Valid transactions processed by the Hydra Head.
- UTXOs committed to the Hydra node.
- Connected peers and their status.
- Snapshots that summarize the current state.
- Hydra protocol parameters.

Additionally, a raw log is available that shows every event occurring in the Hydra Head in real-time.

Hydra explorer exposes key information through a REST API and UI pages:
- Valid transactions: /transactions
- Committed UTXOs: /committed
- Connected peers: /peers
- Snapshots: /snapshots
- Protocol parameters: /protocol_params
- All events: /log

## Does Hydra Explorer support multi-node setups?
Hydra Explorer is designed to connect to a single Hydra node at a time. To monitor multiple Hydra Heads running on
different nodes, you would need to run separate instances of Hydra Explorer for each node. Multi-node support could
potentially be added in future versions, depending on community needs and feedback.

## What are the system requirements for Hydra Explorer?
To run Hydra Explorer, you need:

- Elixir and Phoenix installed on your system.
- A running Hydra node.
- SQLite installed (for testing/dry-run mode).

Hydra Explorer is designed to run efficiently on standard development setups.

## Can I use Hydra Explorer in a production environment?
While Hydra Explorer is currently focused on development and debugging workflows, it can be adapted for production use.
Keep in mind that it does not persist log data, so for long-term production use, additional logging mechanisms might be
required.

## Where can I learn more about the Hydra protocol?
To learn more about Hydra and its underlying protocol, you can visit the official Hydra documentation:
https://hydra.family/head-protocol/unstable/docs/tutorial/. This resource provides a detailed explanation of Hydra
Heads, the Layer 2 protocol, and how it interacts with the Cardano blockchain.


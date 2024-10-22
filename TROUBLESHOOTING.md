# Common problems

If you have any issues setting up a Hydra node, please refer to the Hydra documentation: https://hydra.family/

If you encounter any issues not listed in this document, feel free to open an issue in the repository.

## The application doesn't start
Please make sure you have the Elixir toolchain installed, up-to-date dependencies and the HYDRA_NODE_URL is set
correctly.

## Connection to Hydra node fails
If Hydra Explorer is unable to connect to the Hydra node, verify the WebSocket URL is correct and that the Hydra node is
running. Check for errors in the Phoenix logs and ensure there are no firewall or network restrictions between the
Explorer and the node.

## No messages appearing in the log
If the live log view does not display any Hydra messages, confirm that the WebSocket connection is active. You can do
this by checking the Phoenix console logs for a successful connection message. If the Hydra node is running and the
WebSocket URL is correct, the issue may be with the node itself: ensure it is broadcasting messages.

## Incorrect or missing data
If transaction details appear incomplete or incorrect, ensure the Hydra node's WebSocket and HTTP API are properly
exposed and that they return valid data.

## Hydra node disconnects intermittently
If you experience frequent disconnects from the Hydra node, check the stability of the node itself and its WebSocket
implementation. Ensure that the Hydra node has sufficient resources and is not overloaded. Hydra Explorer will attempt
to reconnect automatically; upon reconnect, the message log will refresh with replayed data.

## Parameter cache not updating
If the protocol parameters displayed in the interface are outdated or not refreshing, restart the Phoenix server. Hydra
Explorer caches these values for the duration of its runtime, so restarting the server forces a fresh fetch from the
Hydra node.

## High CPU usage or performance issues
If Hydra Explorer consumes too much CPU or lags, ensure that your machine is not overloaded by other processes. Consider
running the Phoenix server with MIX_ENV=prod to optimize performance.

## Cannot run without Hydra node
Make sure you have set the DRY_RUN env variable.


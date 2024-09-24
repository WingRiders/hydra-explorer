defmodule HydraExplorerWeb.ApiController do
  use HydraExplorerWeb, :controller

  alias HydraExplorer.MessageStore
  alias HydraExplorer.ProtocolParams
  alias HydraExplorerWeb.Peers
  alias HydraExplorerWeb.Snapshots
  alias HydraExplorerWeb.Transactions
  alias HydraExplorerWeb.Committed

  def protocol_params(conn, _params) do
    protocol_params = ProtocolParams.get()
    json(conn, %{protocol_params: protocol_params})
  end

  def peers(conn, _params) do
    peers = MessageStore.all() |> Peers.messages_peers() |> Peers.peers_connected()
    json(conn, %{peers: peers})
  end

  def snapshots(conn, _params) do
    snapshots =
      MessageStore.all() |> Snapshots.messages_snapshots() |> Enum.map(&Map.from_struct/1)

    json(conn, %{snapshots: snapshots})
  end

  def transactions(conn, _params) do
    transactions =
      MessageStore.all() |> Transactions.messages_tx_valid() |> Transactions.as_transactions()

    json(conn, %{transactions: transactions})
  end

  def committed(conn, _params) do
    committed =
      MessageStore.all() |> Committed.messages_committed() |> Enum.map(&Map.from_struct/1)

    json(conn, %{committed: committed})
  end

  def log(conn, _params) do
    messages =
      MessageStore.all()
      |> Enum.map(fn m ->
        m
        |> Map.from_struct()
        |> Map.put(:type, List.last(Module.split(m.__struct__)))
      end)

    json(conn, %{messages: messages})
  end
end

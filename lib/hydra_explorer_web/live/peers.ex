defmodule HydraExplorerWeb.Peers do
  use HydraExplorerWeb, :live_view

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()
    socket = assign(socket, peers: peers_connected(messages_peers(messages)))
    {:ok, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket = assign(socket, peers: peers_connected(messages_peers(messages)))
    {:noreply, socket}
  end

  defp peers_connected(connected_messages) do
    Enum.reduce(Enum.reverse(connected_messages), %{}, &reduce_peer_message/2)
  end

  defp reduce_peer_message(%Message.PeerConnected{} = msg, %{} = state) do
    Map.put(state, msg.peer, msg.timestamp)
  end

  defp reduce_peer_message(%Message.PeerDisconnected{} = msg, %{} = state) do
    Map.drop(state, [msg.peer])
  end

  defp messages_peers(messages) do
    Enum.filter(messages, fn m ->
      m.__struct__ == Message.PeerConnected or m.__struct__ == Message.PeerDisconnected
    end)
  end
end

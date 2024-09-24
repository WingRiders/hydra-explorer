defmodule HydraExplorerWeb.Snapshots do
  use HydraExplorerWeb, :live_view

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()
    socket = assign(socket, snapshots: messages_snapshots(messages))
    {:ok, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket = assign(socket, snapshots: messages_snapshots(messages))
    {:noreply, socket}
  end

  defp messages_snapshots(messages) do
    Enum.filter(messages, fn m ->
      m.__struct__ == Message.SnapshotConfirmed
    end)
  end
end

defmodule HydraExplorerWeb.Committed do
  use HydraExplorerWeb, :live_view

  require Logger

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()
    socket = assign(socket, messages_committed: messages_committed(messages))
    {:ok, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket = assign(socket, messages_committed: messages_committed(messages))
    {:noreply, socket}
  end

  defp messages_committed(messages) do
    Enum.filter(messages, fn m -> m.__struct__ == Message.Committed end)
  end
end

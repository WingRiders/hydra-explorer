defmodule HydraExplorerWeb.Committed do
  use HydraExplorerWeb, :live_view

  require Logger

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()

    limit = 10
    offset = 0
    committed = messages_committed(messages)

    socket =
      assign(socket,
        messages_committed_all: committed,
        messages_committed_len: length(committed),
        messages_committed: Enum.take(committed, limit),
        offset: offset,
        limit: limit
      )

    {:ok, socket}
  end

  def handle_event("prev_page", _params, socket) do
    new_offset = max(socket.assigns.offset - socket.assigns.limit, 0)

    messages_committed =
      socket.assigns.messages_committed_all
      |> Enum.drop(new_offset)
      |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, messages_committed: messages_committed)
    {:noreply, socket}
  end

  def handle_event("next_page", _params, socket) do
    new_offset = min(socket.assigns.offset + socket.assigns.limit, socket.assigns.messages_len)

    messages_committed =
      socket.assigns.messages_committed_all
      |> Enum.drop(new_offset)
      |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, messages_committed: messages_committed)
    {:noreply, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket = assign(socket, messages_committed: messages_committed(messages))
    {:noreply, socket}
  end

  defp messages_committed(messages) do
    Enum.filter(messages, fn m -> m.__struct__ == Message.Committed end)
  end
end

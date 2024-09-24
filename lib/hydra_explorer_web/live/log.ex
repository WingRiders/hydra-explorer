defmodule HydraExplorerWeb.Log do
  use HydraExplorerWeb, :live_view

  require Logger

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()

    limit = 10
    offset = 0

    socket =
      assign(socket,
        messages: Enum.take(messages, limit),
        messages_all: messages,
        messages_len: length(messages),
        offset: offset,
        limit: limit
      )

    {:ok, socket}
  end

  def handle_event("prev_page", _params, socket) do
    new_offset = max(socket.assigns.offset - socket.assigns.limit, 0)

    messages =
      socket.assigns.messages_all |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, messages: messages)
    {:noreply, socket}
  end

  def handle_event("next_page", _params, socket) do
    new_offset = min(socket.assigns.offset + socket.assigns.limit, socket.assigns.messages_len)

    messages =
      socket.assigns.messages_all |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, messages: messages)
    {:noreply, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket = assign(socket, messages: messages)
    {:noreply, socket}
  end
end

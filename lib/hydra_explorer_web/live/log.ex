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

    message_types =
      Enum.map(messages, fn m -> m.__struct__ |> Module.split() |> List.last() end) |> Enum.uniq()

    socket =
      assign(socket,
        messages: Enum.take(messages, limit),
        messages_all: messages,
        messages_filtered: messages,
        messages_len: length(messages),
        message_types: message_types,
        types_selected: [],
        offset: offset,
        limit: limit
      )

    {:ok, socket}
  end

  def handle_event("messages_filter", params, socket) do
    types_selected = params["types_selected"]

    messages_filtered =
      if is_nil(types_selected) do
        socket.assigns.messages_all
      else
        Enum.filter(socket.assigns.messages_all, fn m ->
          (m.__struct__ |> Module.split() |> List.last()) in types_selected
        end)
      end

    socket =
      assign(socket,
        messages: Enum.take(messages_filtered, socket.assigns.limit),
        messages_filtered: messages_filtered,
        messages_len: length(messages_filtered),
        types_selected: types_selected || [],
        offset: 0
      )

    {:noreply, socket}
  end

  def handle_event("prev_page", _params, socket) do
    new_offset = max(socket.assigns.offset - socket.assigns.limit, 0)

    messages =
      socket.assigns.messages_filtered |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket =
      assign(socket,
        offset: new_offset,
        messages: messages,
        messages_len: length(socket.assigns.messages_filtered)
      )

    {:noreply, socket}
  end

  def handle_event("next_page", _params, socket) do
    new_offset = min(socket.assigns.offset + socket.assigns.limit, socket.assigns.messages_len)

    messages =
      socket.assigns.messages_filtered
      |> Enum.drop(new_offset)
      |> Enum.take(socket.assigns.limit)

    socket =
      assign(socket,
        offset: new_offset,
        messages: messages,
        messages_len: length(socket.assigns.messages_filtered)
      )

    {:noreply, socket}
  end

  def handle_info({:all_messages, messages_all}, socket) do
    message_types =
      Enum.map(messages_all, fn m -> m.__struct__ |> Module.split() |> List.last() end)
      |> Enum.uniq()

    socket = assign(socket, messages_all: messages_all, message_types: message_types)
    {:noreply, socket}
  end
end

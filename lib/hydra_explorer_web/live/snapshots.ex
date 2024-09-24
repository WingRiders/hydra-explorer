defmodule HydraExplorerWeb.Snapshots do
  use HydraExplorerWeb, :live_view

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()

    limit = 10
    offset = 0
    snapshots = messages_snapshots(messages)

    socket =
      assign(socket,
        snapshots_all: snapshots,
        snapshots_len: length(snapshots),
        snapshots: Enum.take(snapshots, limit),
        offset: offset,
        limit: limit
      )

    {:ok, socket}
  end

  def handle_event("prev_page", _params, socket) do
    new_offset = max(socket.assigns.offset - socket.assigns.limit, 0)

    snapshots =
      socket.assigns.snapshots_all |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, snapshots: snapshots)
    {:noreply, socket}
  end

  def handle_event("next_page", _params, socket) do
    new_offset = min(socket.assigns.offset + socket.assigns.limit, socket.assigns.messages_len)

    snapshots =
      socket.assigns.snapshots_all |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, snapshots: snapshots)
    {:noreply, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket = assign(socket, snapshots: messages_snapshots(messages))
    {:noreply, socket}
  end

  def messages_snapshots(messages) do
    Enum.filter(messages, fn m ->
      m.__struct__ == Message.SnapshotConfirmed
    end)
  end
end

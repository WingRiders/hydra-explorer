defmodule HydraExplorerWeb.Log do
  use HydraExplorerWeb, :live_view

  require Logger

  alias Phoenix.PubSub
  alias HydraExplorer.MessageStore

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()

    socket = assign(socket, messages: messages)

    {:ok, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket =
      assign(socket, messages: messages)

    {:noreply, socket}
  end
end

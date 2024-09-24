defmodule HydraExplorerWeb.Transactions do
  use HydraExplorerWeb, :live_view

  alias Phoenix.PubSub
  alias HydraExplorer.Tx
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()

    socket =
      assign(socket, transactions: messages |> messages_tx_valid() |> as_transactions())

    {:ok, socket}
  end

  def handle_info({:all_messages, messages}, socket) do
    socket =
      assign(socket, transactions: messages |> messages_tx_valid() |> as_transactions())

    {:noreply, socket}
  end

  defp as_transactions(messages) do
    Enum.map(messages, fn m ->
      %{data: Tx.from_cbor(m.transaction["cbor_hex"]), id: m.transaction["tx_id"]}
    end)
  end

  defp messages_tx_valid(messages) do
    Enum.filter(messages, fn m ->
      m.__struct__ == Message.TxValid
    end)
  end
end

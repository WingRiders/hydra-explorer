defmodule HydraExplorerWeb.Transactions do
  use HydraExplorerWeb, :live_view

  alias Phoenix.PubSub
  alias HydraExplorer.Tx
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Message

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(HydraExplorer.PubSub, "hydra_head")
    messages = MessageStore.all()

    limit = 10
    offset = 0
    transactions = messages |> messages_tx_valid() |> as_transactions()

    socket =
      assign(socket,
        transactions_all: transactions,
        transactions: Enum.take(transactions, limit),
        transactions_len: length(transactions),
        offset: offset,
        limit: limit
      )

    {:ok, socket}
  end

  def handle_event("prev_page", _params, socket) do
    new_offset = max(socket.assigns.offset - socket.assigns.limit, 0)

    transactions =
      socket.assigns.transactions_all |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, transactions: transactions)
    {:noreply, socket}
  end

  def handle_event("next_page", _params, socket) do
    new_offset = min(socket.assigns.offset + socket.assigns.limit, socket.assigns.messages_len)

    transactions =
      socket.assigns.transactions_all |> Enum.drop(new_offset) |> Enum.take(socket.assigns.limit)

    socket = assign(socket, offset: new_offset, transactions: transactions)
    {:noreply, socket}
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

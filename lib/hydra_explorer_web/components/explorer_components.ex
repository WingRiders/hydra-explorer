defmodule HydraExplorerWeb.ExplorerComponents do
  @moduledoc """
    Provides Hydra-related components like utxo details.
  """

  use Phoenix.Component

  attr :utxo_id, :string, required: true
  attr :utxo_data, :map, required: true

  def utxo_details(assigns) do
    [tx_id, out_index] = assigns.utxo_id |> String.split("_")
    assigns = assign(assigns, tx_id: tx_id, out_index: out_index)

    ~H"""
    <div class="bg-gray-100 p-4 rounded-lg shadow-sm grid grid-cols-2 grid-cols-[1fr,1fr]">
      <p class="font-semibold grid-col-1">Tx id:</p>
      <p class="grid-col-2">
        <%= @tx_id %>
      </p>
      <p class="font-semibold grid-col-1">Output index:</p>
      <p class="grid-col-2">
        <%= @out_index %>
      </p>
      <p class="grid-col-1">Address:</p>
      <p class="grid-col-2"><%= @utxo_data["address"] %></p>
      <p class="grid-col-1">Datum:</p>
      <p class="grid-col-2"><%= @utxo_data["datum"] || "N/A" %></p>
      <p class="grid-col-1">Datum Hash:</p>
      <p class="grid-col-2"><%= @utxo_data["datumhash"] || "N/A" %></p>
      <p class="grid-col-1">Inline Datum:</p>
      <p class="grid-col-2"><%= @utxo_data["inline_datum"] || "N/A" %></p>
      <p class="grid-col-1">
        Reference Script:
      </p>
      <p class="grid-col-2"><%= @utxo_data["referenceScript"] || "N/A" %></p>
    </div>
    """
  end
end

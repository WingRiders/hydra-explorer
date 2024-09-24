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
    <div class="bg-gray-100 p-4 rounded-lg shadow-sm grid grid-cols-[1fr,4fr]">
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

  def tx_details(assigns) do
    ~H"""
    <div class="bg-white shadow-md rounded-lg p-6">
      <h2 class="text-lg font-bold mb-6 text-gray-700">Transaction Overview</h2>
      <!-- Transaction Inputs and Outputs -->
      <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
        <!-- Inputs Section -->
        <div>
          <h3 class="text-md font-bold mb-2 text-gray-700">Inputs</h3>
          <div class="border border-gray-300 rounded-lg">
            <%= for input <- @tx["body"]["inputs"] do %>
              <div class="p-4 border-b border-gray-300">
                <p class="text-sm text-gray-600">
                  Tx ID:
                  <span class="font-semibold text-gray-900 break-words whitespace-pre-wrap">
                    <%= input["transaction_id"] %>
                  </span>
                </p>
                <p class="text-sm text-gray-600">
                  Index: <span class="font-semibold text-gray-900"><%= input["index"] %></span>
                </p>
              </div>
            <% end %>
          </div>
        </div>
        <!-- Outputs Section -->
        <div>
          <h3 class="text-md font-bold mb-2 text-gray-700">Outputs</h3>
          <div class="border border-gray-300 rounded-lg">
            <%= for output <- @tx["body"]["outputs"] do %>
              <div class="p-4 border-b border-gray-300">
                <p class="text-sm text-gray-600">
                  Address:
                  <span class="font-semibold text-gray-900 break-words whitespace-pre-wrap">
                    <%= output["address"] %>
                  </span>
                </p>
                <p class="text-sm text-gray-600">
                  Amount:
                  <span class="font-semibold text-gray-900">
                    <%= output["amount"]["coin"] %> lovelace
                  </span>
                </p>
              </div>
            <% end %>
          </div>
        </div>
      </div>
      <!-- Additional Details -->
      <div class="mt-6">
        <h3 class="text-md font-bold mb-2 text-gray-700">Transaction Details</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
            <p class="text-sm text-gray-600">Transaction Fee:</p>
            <p class="font-semibold text-gray-900"><%= @tx["body"]["fee"] %> lovelace</p>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
            <p class="text-sm text-gray-600">Signatures:</p>
            <ul>
              <%= for sig <- @tx["witness_set"]["vkeys"] do %>
                <li class="mt-2">
                  <p class="text-sm text-gray-600">
                    VKey:
                    <span class="font-semibold text-gray-900 break-words whitespace-pre-wrap">
                      <%= sig["vkey"] %>
                    </span>
                  </p>
                  <p class="text-sm text-gray-600">
                    Signature:
                    <span class="font-semibold text-gray-900 break-words whitespace-pre-wrap">
                      <%= sig["signature"] %>
                    </span>
                  </p>
                </li>
              <% end %>
            </ul>
          </div>
        </div>
      </div>
    </div>
    """
  end
end

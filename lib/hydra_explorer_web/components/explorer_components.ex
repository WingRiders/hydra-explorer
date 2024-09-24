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
      <p class="font-semibold grid-col-1">Index:</p>
      <p class="grid-col-2">
        <%= @out_index %>
      </p>
      <p class="grid-col-1">Lovelace</p>
      <p class="grid-col-2">
        <%= @utxo_data["value"]["lovelace"] %>
      </p>
      <!-- Display other tokens -->
      <%= for {asset_name, quantity} <- Map.drop(@utxo_data["value"], ["lovelace"]) do %>
        <p class="grid-col-1">
          <%= asset_name %>
        </p>
        <p class="grid-col-2">
          <%= quantity %>
        </p>
      <% end %>
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
      <p class="grid-col-2"><%= @utxo_data["reference_script"] || "N/A" %></p>
    </div>
    """
  end

  attr :id, :string, required: true
  attr :data, :map, required: true

  def tx_details(assigns) do
    ~H"""
    <div class="bg-white shadow-md rounded-lg p-6">
      <div class="mb-6">
        <h2 class="text-lg font-bold text-gray-700">Transaction</h2>
        <p class="text-sm font-semibold text-gray-900 break-words"><%= @id %></p>
      </div>
      <!-- Transaction Inputs and Outputs -->
      <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
        <!-- Inputs Section -->
        <div>
          <h3 class="text-md font-bold mb-2 text-gray-700">Inputs</h3>
          <div class="border border-gray-300 rounded-lg">
            <%= for input <- @data["body"]["inputs"] do %>
              <div class="p-4 border-b border-gray-300">
                <p class="text-sm text-gray-600">
                  Tx id:
                  <span class="font-semibold text-gray-900 break-words">
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
            <%= for {output, index} <- Enum.with_index(@data["body"]["outputs"]) do %>
              <div class="p-4 border-b border-gray-300">
                <p class="text-sm text-gray-600">
                  Index: <span class="font-semibold text-gray-900"><%= index %></span>
                </p>
                <p class="text-sm text-gray-600">
                  Address:
                  <span class="font-semibold text-gray-900 break-words">
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
      <!-- Collateral and Mint Details -->
      <div class="mt-6">
        <h3 class="text-md font-bold mb-2 text-gray-700">Collateral and Mint Details</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
            <p class="text-sm text-gray-600">Collateral:</p>
            <%= if @data["body"]["collateral"] do %>
              <ul>
                <%= for collateral <- @data["body"]["collateral"] do %>
                  <li>
                    Tx id: <span class="break-words"><%= collateral["transaction_id"] %></span>
                    - Index: <%= collateral["index"] %>
                  </li>
                <% end %>
              </ul>
            <% else %>
              <p>None</p>
            <% end %>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
            <p class="text-sm text-gray-600">Mint:</p>
            <%= if @data["body"]["mint"] do %>
              <ul>
                <%= for {policy_id, assets} <- @data["body"]["mint"] do %>
                  <li>
                    <p>Policy id: <span class="break-words"><%= policy_id %></span></p>
                    <ul>
                      <%= for {asset_name, amount} <- assets do %>
                        <li>Asset: <%= asset_name %> - Amount: <%= amount %></li>
                      <% end %>
                    </ul>
                  </li>
                <% end %>
              </ul>
            <% else %>
              <p>None</p>
            <% end %>
          </div>
        </div>
      </div>
      <!-- Script Data and Auxiliary Data -->
      <div class="mt-6">
        <h3 class="text-md font-bold mb-2 text-gray-700">Script and Auxiliary Data</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
            <p class="text-sm text-gray-600">Script Data Hash:</p>
            <%= if @data["body"]["script_data_hash"] do %>
              <p class="break-words"><%= @data["body"]["script_data_hash"] %></p>
            <% else %>
              <p>None</p>
            <% end %>
          </div>

          <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
            <p class="text-sm text-gray-600">Auxiliary Data Hash:</p>
            <%= if @data["body"]["auxiliary_data_hash"] do %>
              <p class="break-words"><%= @data["body"]["auxiliary_data_hash"] %></p>
            <% else %>
              <p>None</p>
            <% end %>
          </div>
        </div>
      </div>
      <!-- Witness Section (Signatures, etc.) -->
      <div class="mt-6">
        <h3 class="text-md font-bold mb-2 text-gray-700">Witnesses</h3>
        <div class="border border-gray-300 rounded-lg p-4">
          <%= if @data["witness_set"]["vkeys"] do %>
            <%= for witness <- @data["witness_set"]["vkeys"] do %>
              <div class="mb-4">
                <p class="text-sm text-gray-600">
                  VKey:
                  <span class="font-semibold text-gray-900 break-words"><%= witness["vkey"] %></span>
                </p>
                <p class="text-sm text-gray-600">
                  Signature:
                  <span class="font-semibold text-gray-900 break-words">
                    <%= witness["signature"] %>
                  </span>
                </p>
              </div>
            <% end %>
          <% else %>
            <p>None</p>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  attr :offset, :integer, required: true
  attr :limit, :integer, required: true
  attr :len, :integer, required: true
  attr :top, :boolean, required: true

  def pagination(assigns) do
    ~H"""
    <div
      id={if @top, do: "pagination-container-top", else: "pagination-container-bottom"}
      phx-hook="scrollToTopHook"
      class={if @top, do: "flex justify-between mb-4", else: "flex justify-between mt-4"}
    >
      <!-- Previous Button -->
      <button
        type="button"
        class={
          if @offset == 0,
            do: "bg-gray-300 text-gray-500 py-2 px-4 rounded cursor-not-allowed",
            else: "bg-gray-300 hover:bg-gray-400 text-gray-700 font-bold py-2 px-4 rounded"
        }
        phx-click="prev_page"
        disabled={@offset == 0}
      >
        Previous
      </button>
      <!-- Pagination Info -->
      <span class="text-sm text-gray-600">
        Showing <%= @offset + 1 %> to <%= min(@offset + @limit, @len) %> of <%= @len %>
      </span>
      <!-- Next Button -->
      <button
        type="button"
        class={
          if @offset + @limit >= @len,
            do: "bg-gray-300 text-gray-500 py-2 px-4 rounded cursor-not-allowed",
            else: "bg-gray-300 hover:bg-gray-400 text-gray-700 font-bold py-2 px-4 rounded"
        }
        phx-click="next_page"
        disabled={@offset + @limit >= @len}
      >
        Next
      </button>
    </div>
    """
  end
end

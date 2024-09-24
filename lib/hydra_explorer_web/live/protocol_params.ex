defmodule HydraExplorerWeb.ProtocolParams do
  use HydraExplorerWeb, :live_view

  def mount(_params, _session, socket) do
    protocol_parameters = HydraExplorer.ProtocolParams.get()
    socket = assign(socket, protocol_parameters: protocol_parameters)
    {:ok, socket}
  end
end

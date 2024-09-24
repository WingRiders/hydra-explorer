defmodule HydraExplorerWeb.ApiController do
  use HydraExplorerWeb, :controller

  alias HydraExplorer.MessageStore
  alias HydraExplorer.ProtocolParams

  def protocol_parameters(conn, _params) do
    protocol_params = ProtocolParams.get()
    json(conn, %{protocol_parameters: protocol_params})
  end

  def messages(conn, _params) do
    messages =
      MessageStore.all()
      |> Enum.map(fn m ->
        m
        |> Map.from_struct()
        |> Map.put(:type, List.last(Module.split(m.__struct__)))
      end)

    json(conn, %{messages: messages})
  end
end

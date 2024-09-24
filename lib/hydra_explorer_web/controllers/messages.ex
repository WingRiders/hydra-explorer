defmodule HydraExplorerWeb.MessagesController do
  use HydraExplorerWeb, :controller

  alias HydraExplorer.MessageStore

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

defmodule HydraExplorer.Head do
  use WebSockex

  alias HydraExplorer.Message
  alias HydraExplorer.MessageStore
  alias HydraExplorer.Query

  require Logger

  def start_link(opts) do
    dry? = Keyword.get(opts, :dry?)

    if dry? do
      Enum.each(Query.messages_load(), &MessageStore.push/1)
      GenServer.start_link(__MODULE__, %{}, [name: __MODULE__] ++ opts)
    else
      url = Keyword.get(opts, :url)
      WebSockex.start_link(url, __MODULE__, %{}, name: __MODULE__)
    end
  end

  def init(_) do
    {:ok, %{}}
  end

  @impl true
  def handle_connect(_conn, state) do
    Logger.info("Connected to a hydra websocket")
    {:ok, state}
  end

  @impl true
  def handle_frame({type, msg}, state) do
    Logger.debug("Received Message - Type: #{inspect(type)} -- Message: #{inspect(msg)}")

    decoded =
      msg
      |> Jason.decode!()
      |> Recase.Enumerable.convert_keys(&Recase.to_snake/1)
      |> Message.decode_message()

    if decoded, do: MessageStore.push(decoded)
    {:ok, state}
  end

  @impl true
  def handle_cast({:send, {type, msg} = frame}, state) do
    Logger.debug("Sending #{type} frame with payload: #{msg}")
    {:reply, frame, state}
  end
end

defmodule HydraExplorer.Head do
  use WebSockex

  alias HydraExplorer.Message

  require Logger

  def start_link(state) do
    WebSockex.start_link("ws://127.0.0.1:4001", __MODULE__, state, name: __MODULE__)
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

    if decoded, do: HydraExplorer.MessageStore.push(decoded)
    {:ok, state}
  end

  @impl true
  def handle_cast({:send, {type, msg} = frame}, state) do
    Logger.debug("Sending #{type} frame with payload: #{msg}")
    {:reply, frame, state}
  end
end

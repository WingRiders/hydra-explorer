defmodule HydraExplorer.MessageStore do
  use GenServer

  alias Phoenix.PubSub

  def start_link(opts) do
    GenServer.start_link(__MODULE__, %{}, [name: __MODULE__] ++ opts)
  end

  def all() do
    GenServer.call(__MODULE__, :all)
  end

  def push(message) do
    GenServer.cast(__MODULE__, {:push, message})
  end

  @impl true
  def init(state) do
    {:ok, Map.merge(%{messages: []}, state)}
  end

  @impl true
  def handle_cast({:push, message}, state) do
    messages = [message | state.messages]
    PubSub.broadcast(HydraExplorer.PubSub, "hydra_head", {:all_messages, messages})
    {:noreply, %{state | messages: messages}}
  end

  @impl true
  def handle_call(:all, _from, state) do
    {:reply, state.messages, state}
  end
end

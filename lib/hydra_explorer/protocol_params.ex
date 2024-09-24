defmodule HydraExplorer.ProtocolParams do
  use Agent

  def start_link(opts) do
    url = Keyword.get(opts, :url)
    Agent.start_link(fn -> %{protocol_params: fetch(url)} end, [name: __MODULE__] ++ opts)
  end

  def get() do
    Agent.get(__MODULE__, fn state -> state.protocol_params end)
  end

  defp fetch(url) when is_binary(url) do
    Finch.build(
      :get,
      url <> "/protocol-parameters"
    )
    |> Finch.request(HydraExplorer.Finch)
    |> case do
      {:ok, response} when response.status == 200 ->
        response.body |> Jason.decode!() |> Recase.Enumerable.convert_keys(&Recase.to_snake/1)

      err ->
        err
    end
  end
end

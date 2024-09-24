defmodule HydraExplorer.Query do
  import Ecto.Query, warn: false

  alias HydraExplorer.Repo
  alias HydraExplorer.Message

  def messages_store(messages) do
    messages_db = Enum.map(messages, &Message.to_message_db/1)
    Repo.insert_all(Message, messages_db)
  end

  def messages_load() do
    Repo.all(Message)
  end
end

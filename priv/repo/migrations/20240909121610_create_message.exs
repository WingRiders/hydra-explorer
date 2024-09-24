defmodule HydraExplorer.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :type, :integer, null: false
      add :json, :string, null: false
    end
  end
end

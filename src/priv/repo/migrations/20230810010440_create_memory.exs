defmodule Pcsite.Repo.Migrations.CreateMemory do
  use Ecto.Migration

  def change do
    create table(:memory) do
      add :memoryname, :string
      add :memoryprice, :string
      add :memorygeneration, :string
      add :memoryManufacturer, :string
      add :uuid, :string

      timestamps()
    end

    create unique_index(:memory, [:uuid])
  end
end

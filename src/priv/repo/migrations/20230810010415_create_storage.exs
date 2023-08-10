defmodule Pcsite.Repo.Migrations.CreateStorage do
  use Ecto.Migration

  def change do
    create table(:storage) do
      add :storagename, :string
      add :storageprice, :string
      add :storageManufacturer, :string
      add :typeOfStorage, :string
      add :uuid, :string
      add :nvme, :boolean, default: false, null: false
      add :generation, :string

      timestamps()
    end

    create unique_index(:storage, [:uuid])
  end
end

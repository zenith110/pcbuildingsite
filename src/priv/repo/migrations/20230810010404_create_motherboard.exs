defmodule Pcsite.Repo.Migrations.CreateMotherboard do
  use Ecto.Migration

  def change do
    create table(:motherboard) do
      add :motherboardname, :string
      add :motherboardprice, :string
      add :motherboardManufacturer, :string
      add :typeOfMotherboard, :string
      add :uuid, :string
      add :nvme, :boolean, default: false, null: false
      add :motherboardGeneration, :string
      add :chipset, :string

      timestamps()
    end

    create unique_index(:motherboard, [:uuid])
  end
end

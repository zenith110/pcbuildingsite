defmodule Pcsite.Repo.Migrations.CreatePsu do
  use Ecto.Migration

  def change do
    create table(:psu) do
      add :psuname, :string
      add :psuprice, :string
      add :psuManufacturer, :string
      add :typeOfPsu, :string
      add :uuid, :string

      timestamps()
    end

    create unique_index(:psu, [:uuid])
  end
end

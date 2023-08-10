defmodule Pcsite.Repo.Migrations.CreateCpu do
  use Ecto.Migration

  def change do
    create table(:cpu) do
      add :cpuname, :string
      add :cpuprice, :string
      add :cpugeneration, :string
      add :uuid, :string
      add :allowedMotherboardChipset, {:array, :string}

      timestamps()
    end

    create unique_index(:cpu, [:uuid])
  end
end

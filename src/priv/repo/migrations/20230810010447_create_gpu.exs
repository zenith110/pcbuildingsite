defmodule Pcsite.Repo.Migrations.CreateGpu do
  use Ecto.Migration

  def change do
    create table(:gpu) do
      add :gpuname, :string
      add :gpuprice, :string
      add :gpugeneration, :string
      add :uuid, :string

      timestamps()
    end

    create unique_index(:gpu, [:uuid])
  end
end

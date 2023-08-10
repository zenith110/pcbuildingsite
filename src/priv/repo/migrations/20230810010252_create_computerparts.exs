defmodule Pcsite.Repo.Migrations.CreateComputerparts do
  use Ecto.Migration

  def change do
    create table(:computerparts) do
      add :cpu, :string
      add :gpu, :string
      add :psu, :string
      add :memory, :string
      add :status, :string
      add :storage, {:array, :string}
      add :fans, {:array, :string}
      add :finalPrice, :string
      add :invoiceCost, :string
      add :uuid, :string
      add :dateCompleted, :naive_datetime
      add :discontinued, :boolean, default: false, null: false
      add :onSale, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:computerparts, [:uuid])
  end
end

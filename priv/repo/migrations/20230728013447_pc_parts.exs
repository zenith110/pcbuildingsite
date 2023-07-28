defmodule Pcsite.Repo.Migrations.PcParts do
  use Ecto.Migration

  def change do
  create table (:pcparts)do
    add :cpu, :string
    add :gpu, :string
    add :psu, :string
    add :memory, :string
    add :status, :string
    add :storage, {:array, :string}
    add :fans, {:array, :string}
    add :finalPrice, :string
    add :invoiceCost, :string
    add(:uuid, :string, primary_key: true)
    timestamps()
    end
  end
end

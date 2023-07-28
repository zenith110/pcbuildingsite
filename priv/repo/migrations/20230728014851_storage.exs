defmodule Pcsite.Repo.Migrations.Storage do
  use Ecto.Migration

  def change do
  create table (:storage)do
    add :storageproductname, :string
    add :storageprice, :string
    add :storagegeneration, :string
    add(:uuid, :string, primary_key: true)
    timestamps()
    end
  end
end

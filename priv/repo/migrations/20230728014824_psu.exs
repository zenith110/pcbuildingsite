defmodule Pcsite.Repo.Migrations.Psu do
  use Ecto.Migration

  def change do
  create table (:psu)do
    add :psuname, :string
    add :psuprice, :string
    add(:uuid, :string, primary_key: true)
    timestamps()
    end
  end
end

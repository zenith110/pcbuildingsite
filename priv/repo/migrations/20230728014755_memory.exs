defmodule Pcsite.Repo.Migrations.Memory do
  use Ecto.Migration

  def change do
  create table (:memory)do
    add :memoryname, :string
    add :memoryprice, :string
    add :memorygeneration, :string
    add(:uuid, :string, primary_key: true)
    timestamps()
    end
  end
end

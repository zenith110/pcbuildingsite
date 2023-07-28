defmodule Pcsite.Repo.Migrations.Cpu do
  use Ecto.Migration

  def change do
  create table (:cpu)do
    add :cpuname, :string
    add :cpuprice, :string
    add :cpugeneration, :string
    add(:uuid, :string, primary_key: true)
    timestamps()
    end
  end
end

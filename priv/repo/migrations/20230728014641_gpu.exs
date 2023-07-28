defmodule Pcsite.Repo.Migrations.Gpu do
  use Ecto.Migration

  def change do
  create table (:gpu)do
    add :gpuname, :string
    add :gpuprice, :string
    add :gpugeneration, :string
    add(:uuid, :string, primary_key: true)
    timestamps()
    end
  end
end

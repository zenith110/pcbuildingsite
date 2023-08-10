defmodule Pcsite.Computer.Storage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storage" do
    field :uuid, :string
    field :storagename, :string
    field :storageprice, :string
    field :storageManufacturer, :string
    field :typeOfStorage, :string
    field :nvme, :boolean, default: false
    field :generation, :string

    timestamps()
  end

  @doc false
  def changeset(storage, attrs) do
    storage
    |> cast(attrs, [:storagename, :storageprice, :storageManufacturer, :typeOfStorage, :uuid, :nvme, :generation])
    |> validate_required([:storagename, :storageprice, :storageManufacturer, :typeOfStorage, :uuid, :nvme, :generation])
    |> unique_constraint(:uuid)
  end
end

defmodule Pcsite.Computer.Motherboard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "motherboard" do
    field :uuid, :string
    field :motherboardname, :string
    field :motherboardprice, :string
    field :motherboardManufacturer, :string
    field :typeOfMotherboard, :string
    field :nvme, :boolean, default: false
    field :motherboardGeneration, :string
    field :chipset, :string

    timestamps()
  end

  @doc false
  def changeset(motherboard, attrs) do
    motherboard
    |> cast(attrs, [:motherboardname, :motherboardprice, :motherboardManufacturer, :typeOfMotherboard, :uuid, :nvme, :motherboardGeneration, :chipset])
    |> validate_required([:motherboardname, :motherboardprice, :motherboardManufacturer, :typeOfMotherboard, :uuid, :nvme, :motherboardGeneration, :chipset])
    |> unique_constraint(:uuid)
  end
end

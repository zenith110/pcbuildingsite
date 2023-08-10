defmodule Pcsite.Computer.Psu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "psu" do
    field :uuid, :string
    field :psuname, :string
    field :psuprice, :string
    field :psuManufacturer, :string
    field :typeOfPsu, :string

    timestamps()
  end

  @doc false
  def changeset(psu, attrs) do
    psu
    |> cast(attrs, [:psuname, :psuprice, :psuManufacturer, :typeOfPsu, :uuid])
    |> validate_required([:psuname, :psuprice, :psuManufacturer, :typeOfPsu, :uuid])
    |> unique_constraint(:uuid)
  end
end

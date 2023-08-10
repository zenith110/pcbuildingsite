defmodule Pcsite.Computer.ComputerParts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "computerparts" do
    field :cpu, :string
    field :memory, :string
    field :status, :string
    field :uuid, :string
    field :gpu, :string
    field :psu, :string
    field :storage, {:array, :string}
    field :fans, {:array, :string}
    field :finalPrice, :string
    field :invoiceCost, :string
    field :dateCompleted, :naive_datetime
    field :discontinued, :boolean, default: false
    field :onSale, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(computer_parts, attrs) do
    computer_parts
    |> cast(attrs, [:cpu, :gpu, :psu, :memory, :status, :storage, :fans, :finalPrice, :invoiceCost, :uuid, :dateCompleted, :discontinued, :onSale])
    |> validate_required([:cpu, :gpu, :psu, :memory, :status, :storage, :fans, :finalPrice, :invoiceCost, :uuid, :dateCompleted, :discontinued, :onSale])
    |> unique_constraint(:uuid)
  end
end

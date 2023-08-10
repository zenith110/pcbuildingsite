defmodule Pcsite.Computer.Memory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "memory" do
    field :uuid, :string
    field :memoryname, :string
    field :memoryprice, :string
    field :memorygeneration, :string
    field :memoryManufacturer, :string

    timestamps()
  end

  @doc false
  def changeset(memory, attrs) do
    memory
    |> cast(attrs, [:memoryname, :memoryprice, :memorygeneration, :memoryManufacturer, :uuid])
    |> validate_required([:memoryname, :memoryprice, :memorygeneration, :memoryManufacturer, :uuid])
    |> unique_constraint(:uuid)
  end
end

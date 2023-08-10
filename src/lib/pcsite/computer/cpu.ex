defmodule Pcsite.Computer.Cpu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cpu" do
    field :uuid, :string
    field :cpuname, :string
    field :cpuprice, :string
    field :cpugeneration, :string
    field :allowedMotherboardChipset, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(cpu, attrs) do
    cpu
    |> cast(attrs, [:cpuname, :cpuprice, :cpugeneration, :uuid, :allowedMotherboardChipset])
    |> validate_required([:cpuname, :cpuprice, :cpugeneration, :uuid, :allowedMotherboardChipset])
    |> unique_constraint(:uuid)
  end
end

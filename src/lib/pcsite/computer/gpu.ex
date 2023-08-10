defmodule Pcsite.Computer.Gpu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gpu" do
    field :uuid, :string
    field :gpuname, :string
    field :gpuprice, :string
    field :gpugeneration, :string

    timestamps()
  end

  @doc false
  def changeset(gpu, attrs) do
    gpu
    |> cast(attrs, [:gpuname, :gpuprice, :gpugeneration, :uuid])
    |> validate_required([:gpuname, :gpuprice, :gpugeneration, :uuid])
    |> unique_constraint(:uuid)
  end
end

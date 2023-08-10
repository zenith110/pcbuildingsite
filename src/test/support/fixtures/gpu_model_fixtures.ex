defmodule Pcsite.GpuModelFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pcsite.GpuModel` context.
  """

  @doc """
  Generate a gpu.
  """
  def gpu_fixture(attrs \\ %{}) do
    {:ok, gpu} =
      attrs
      |> Enum.into(%{
        uuid: "some uuid",
        gpuname: "some gpuname",
        gpuprice: "some gpuprice",
        gpugeneration: "some gpugeneration"
      })
      |> Pcsite.GpuModel.create_gpu()

    gpu
  end

  @doc """
  Generate a unique gpu uuid.
  """
  def unique_gpu_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a gpu.
  """
  def gpu_fixture(attrs \\ %{}) do
    {:ok, gpu} =
      attrs
      |> Enum.into(%{
        uuid: unique_gpu_uuid(),
        gpuname: "some gpuname",
        gpuprice: "some gpuprice",
        gpugeneration: "some gpugeneration"
      })
      |> Pcsite.GpuModel.create_gpu()

    gpu
  end
end

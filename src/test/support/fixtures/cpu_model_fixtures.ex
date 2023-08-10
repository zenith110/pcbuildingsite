defmodule Pcsite.CpuModelFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pcsite.CpuModel` context.
  """

  @doc """
  Generate a cpu.
  """
  def cpu_fixture(attrs \\ %{}) do
    {:ok, cpu} =
      attrs
      |> Enum.into(%{
        uuid: "some uuid",
        cpuname: "some cpuname",
        cpuprice: "some cpuprice",
        cpugeneration: "some cpugeneration"
      })
      |> Pcsite.CpuModel.create_cpu()

    cpu
  end

  @doc """
  Generate a unique cpu uuid.
  """
  def unique_cpu_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a cpu.
  """
  def cpu_fixture(attrs \\ %{}) do
    {:ok, cpu} =
      attrs
      |> Enum.into(%{
        uuid: unique_cpu_uuid(),
        cpuname: "some cpuname",
        cpuprice: "some cpuprice",
        cpugeneration: "some cpugeneration"
      })
      |> Pcsite.CpuModel.create_cpu()

    cpu
  end
end

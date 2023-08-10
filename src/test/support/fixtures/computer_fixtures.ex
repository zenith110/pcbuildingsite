defmodule Pcsite.ComputerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pcsite.Computer` context.
  """

  @doc """
  Generate a computer_parts.
  """
  def computer_parts_fixture(attrs \\ %{}) do
    {:ok, computer_parts} =
      attrs
      |> Enum.into(%{
        " cpu: "some \" cpu"
      })
      |> Pcsite.Computer.create_computer_parts()

    computer_parts
  end

  @doc """
  Generate a computer_parts.
  """
  def computer_parts_fixture(attrs \\ %{}) do
    {:ok, computer_parts} =
      attrs
      |> Enum.into(%{
        cpu: "some cpu",
        memory: "some memory",
        status: "some status",
        uuid: "some uuid",
        gpu: "some gpu",
        psu: "some psu",
        storage: ["option1", "option2"],
        fans: ["option1", "option2"],
        finalPrice: "some finalPrice",
        invoiceCost: "some invoiceCost"
      })
      |> Pcsite.Computer.create_computer_parts()

    computer_parts
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
      |> Pcsite.Computer.create_cpu()

    cpu
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
      |> Pcsite.Computer.create_gpu()

    gpu
  end

  @doc """
  Generate a unique memory uuid.
  """
  def unique_memory_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a memory.
  """
  def memory_fixture(attrs \\ %{}) do
    {:ok, memory} =
      attrs
      |> Enum.into(%{
        uuid: unique_memory_uuid(),
        memoryname: "some memoryname",
        memoryprice: "some memoryprice",
        memorygeneration: "some memorygeneration",
        memoryManufacturer: "some memoryManufacturer"
      })
      |> Pcsite.Computer.create_memory()

    memory
  end

  @doc """
  Generate a unique psu uuid.
  """
  def unique_psu_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a psu.
  """
  def psu_fixture(attrs \\ %{}) do
    {:ok, psu} =
      attrs
      |> Enum.into(%{
        uuid: unique_psu_uuid(),
        psuname: "some psuname",
        psuprice: "some psuprice",
        psuManufacturer: "some psuManufacturer",
        typeOfPsu: "some typeOfPsu"
      })
      |> Pcsite.Computer.create_psu()

    psu
  end

  @doc """
  Generate a unique storage uuid.
  """
  def unique_storage_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a storage.
  """
  def storage_fixture(attrs \\ %{}) do
    {:ok, storage} =
      attrs
      |> Enum.into(%{
        uuid: unique_storage_uuid(),
        storagename: "some storagename",
        storageprice: "some storageprice",
        storageManufacturer: "some storageManufacturer",
        typeOfStorage: "some typeOfStorage",
        nvme: true,
        generation: "some generation"
      })
      |> Pcsite.Computer.create_storage()

    storage
  end

  @doc """
  Generate a unique computer_parts uuid.
  """
  def unique_computer_parts_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a computer_parts.
  """
  def computer_parts_fixture(attrs \\ %{}) do
    {:ok, computer_parts} =
      attrs
      |> Enum.into(%{
        cpu: "some cpu",
        memory: "some memory",
        status: "some status",
        uuid: unique_computer_parts_uuid(),
        gpu: "some gpu",
        psu: "some psu",
        storage: ["option1", "option2"],
        fans: ["option1", "option2"],
        finalPrice: "some finalPrice",
        invoiceCost: "some invoiceCost",
        dateCompleted: ~N[2023-08-08 02:40:00]
      })
      |> Pcsite.Computer.create_computer_parts()

    computer_parts
  end

  @doc """
  Generate a unique computer_parts uuid.
  """
  def unique_computer_parts_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a computer_parts.
  """
  def computer_parts_fixture(attrs \\ %{}) do
    {:ok, computer_parts} =
      attrs
      |> Enum.into(%{
        cpu: "some cpu",
        memory: "some memory",
        status: "some status",
        uuid: unique_computer_parts_uuid(),
        gpu: "some gpu",
        psu: "some psu",
        storage: ["option1", "option2"],
        fans: ["option1", "option2"],
        finalPrice: "some finalPrice",
        invoiceCost: "some invoiceCost",
        dateCompleted: ~N[2023-08-09 00:46:00],
        discontinued: true,
        onSale: true
      })
      |> Pcsite.Computer.create_computer_parts()

    computer_parts
  end

  @doc """
  Generate a unique computer_parts uuid.
  """
  def unique_computer_parts_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a computer_parts.
  """
  def computer_parts_fixture(attrs \\ %{}) do
    {:ok, computer_parts} =
      attrs
      |> Enum.into(%{
        cpu: "some cpu",
        disabled: true,
        memory: "some memory",
        status: "some status",
        uuid: unique_computer_parts_uuid(),
        gpu: "some gpu",
        psu: "some psu",
        storage: ["option1", "option2"],
        fans: ["option1", "option2"],
        finalPrice: "some finalPrice",
        invoiceCost: "some invoiceCost",
        dateCompleted: ~N[2023-08-09 00:56:00],
        onSale: true
      })
      |> Pcsite.Computer.create_computer_parts()

    computer_parts
  end

  @doc """
  Generate a unique motherboard uuid.
  """
  def unique_motherboard_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a motherboard.
  """
  def motherboard_fixture(attrs \\ %{}) do
    {:ok, motherboard} =
      attrs
      |> Enum.into(%{
        uuid: unique_motherboard_uuid(),
        motherboardname: "some motherboardname",
        motherboardprice: "some motherboardprice",
        motherboardManufacturer: "some motherboardManufacturer",
        typeOfMotherboard: "some typeOfMotherboard",
        nvme: true,
        motherboardGeneration: "some motherboardGeneration"
      })
      |> Pcsite.Computer.create_motherboard()

    motherboard
  end

  @doc """
  Generate a unique motherboard uuid.
  """
  def unique_motherboard_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a motherboard.
  """
  def motherboard_fixture(attrs \\ %{}) do
    {:ok, motherboard} =
      attrs
      |> Enum.into(%{
        uuid: unique_motherboard_uuid(),
        motherboardname: "some motherboardname",
        motherboardprice: "some motherboardprice",
        motherboardManufacturer: "some motherboardManufacturer",
        typeOfMotherboard: "some typeOfMotherboard",
        nvme: true,
        motherboardGeneration: "some motherboardGeneration",
        chipset: "some chipset"
      })
      |> Pcsite.Computer.create_motherboard()

    motherboard
  end

  @doc """
  Generate a unique computer_parts uuid.
  """
  def unique_computer_parts_uuid, do: "some uuid#{System.unique_integer([:positive])}"

  @doc """
  Generate a computer_parts.
  """
  def computer_parts_fixture(attrs \\ %{}) do
    {:ok, computer_parts} =
      attrs
      |> Enum.into(%{
        cpu: "some cpu",
        memory: "some memory",
        status: "some status",
        uuid: unique_computer_parts_uuid(),
        gpu: "some gpu",
        psu: "some psu",
        storage: ["option1", "option2"],
        fans: ["option1", "option2"],
        finalPrice: "some finalPrice",
        invoiceCost: "some invoiceCost",
        dateCompleted: ~N[2023-08-09 01:02:00],
        discontinued: true,
        onSale: true
      })
      |> Pcsite.Computer.create_computer_parts()

    computer_parts
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
        cpugeneration: "some cpugeneration",
        allowedMotherboardChipset: ["option1", "option2"]
      })
      |> Pcsite.Computer.create_cpu()

    cpu
  end
end

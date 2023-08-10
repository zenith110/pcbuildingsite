defmodule Pcsite.CpuModelTest do
  use Pcsite.DataCase

  alias Pcsite.CpuModel

  describe "cpus" do
    alias Pcsite.CpuModel.Cpu

    import Pcsite.CpuModelFixtures

    @invalid_attrs %{uuid: nil, cpuname: nil, cpuprice: nil, cpugeneration: nil}

    test "list_cpus/0 returns all cpus" do
      cpu = cpu_fixture()
      assert CpuModel.list_cpus() == [cpu]
    end

    test "get_cpu!/1 returns the cpu with given id" do
      cpu = cpu_fixture()
      assert CpuModel.get_cpu!(cpu.id) == cpu
    end

    test "create_cpu/1 with valid data creates a cpu" do
      valid_attrs = %{uuid: "some uuid", cpuname: "some cpuname", cpuprice: "some cpuprice", cpugeneration: "some cpugeneration"}

      assert {:ok, %Cpu{} = cpu} = CpuModel.create_cpu(valid_attrs)
      assert cpu.uuid == "some uuid"
      assert cpu.cpuname == "some cpuname"
      assert cpu.cpuprice == "some cpuprice"
      assert cpu.cpugeneration == "some cpugeneration"
    end

    test "create_cpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CpuModel.create_cpu(@invalid_attrs)
    end

    test "update_cpu/2 with valid data updates the cpu" do
      cpu = cpu_fixture()
      update_attrs = %{uuid: "some updated uuid", cpuname: "some updated cpuname", cpuprice: "some updated cpuprice", cpugeneration: "some updated cpugeneration"}

      assert {:ok, %Cpu{} = cpu} = CpuModel.update_cpu(cpu, update_attrs)
      assert cpu.uuid == "some updated uuid"
      assert cpu.cpuname == "some updated cpuname"
      assert cpu.cpuprice == "some updated cpuprice"
      assert cpu.cpugeneration == "some updated cpugeneration"
    end

    test "update_cpu/2 with invalid data returns error changeset" do
      cpu = cpu_fixture()
      assert {:error, %Ecto.Changeset{}} = CpuModel.update_cpu(cpu, @invalid_attrs)
      assert cpu == CpuModel.get_cpu!(cpu.id)
    end

    test "delete_cpu/1 deletes the cpu" do
      cpu = cpu_fixture()
      assert {:ok, %Cpu{}} = CpuModel.delete_cpu(cpu)
      assert_raise Ecto.NoResultsError, fn -> CpuModel.get_cpu!(cpu.id) end
    end

    test "change_cpu/1 returns a cpu changeset" do
      cpu = cpu_fixture()
      assert %Ecto.Changeset{} = CpuModel.change_cpu(cpu)
    end
  end
end

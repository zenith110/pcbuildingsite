defmodule Pcsite.GpuModelTest do
  use Pcsite.DataCase

  alias Pcsite.GpuModel

  describe "gpus" do
    alias Pcsite.GpuModel.Gpu

    import Pcsite.GpuModelFixtures

    @invalid_attrs %{uuid: nil, gpuname: nil, gpuprice: nil, gpugeneration: nil}

    test "list_gpus/0 returns all gpus" do
      gpu = gpu_fixture()
      assert GpuModel.list_gpus() == [gpu]
    end

    test "get_gpu!/1 returns the gpu with given id" do
      gpu = gpu_fixture()
      assert GpuModel.get_gpu!(gpu.id) == gpu
    end

    test "create_gpu/1 with valid data creates a gpu" do
      valid_attrs = %{uuid: "some uuid", gpuname: "some gpuname", gpuprice: "some gpuprice", gpugeneration: "some gpugeneration"}

      assert {:ok, %Gpu{} = gpu} = GpuModel.create_gpu(valid_attrs)
      assert gpu.uuid == "some uuid"
      assert gpu.gpuname == "some gpuname"
      assert gpu.gpuprice == "some gpuprice"
      assert gpu.gpugeneration == "some gpugeneration"
    end

    test "create_gpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GpuModel.create_gpu(@invalid_attrs)
    end

    test "update_gpu/2 with valid data updates the gpu" do
      gpu = gpu_fixture()
      update_attrs = %{uuid: "some updated uuid", gpuname: "some updated gpuname", gpuprice: "some updated gpuprice", gpugeneration: "some updated gpugeneration"}

      assert {:ok, %Gpu{} = gpu} = GpuModel.update_gpu(gpu, update_attrs)
      assert gpu.uuid == "some updated uuid"
      assert gpu.gpuname == "some updated gpuname"
      assert gpu.gpuprice == "some updated gpuprice"
      assert gpu.gpugeneration == "some updated gpugeneration"
    end

    test "update_gpu/2 with invalid data returns error changeset" do
      gpu = gpu_fixture()
      assert {:error, %Ecto.Changeset{}} = GpuModel.update_gpu(gpu, @invalid_attrs)
      assert gpu == GpuModel.get_gpu!(gpu.id)
    end

    test "delete_gpu/1 deletes the gpu" do
      gpu = gpu_fixture()
      assert {:ok, %Gpu{}} = GpuModel.delete_gpu(gpu)
      assert_raise Ecto.NoResultsError, fn -> GpuModel.get_gpu!(gpu.id) end
    end

    test "change_gpu/1 returns a gpu changeset" do
      gpu = gpu_fixture()
      assert %Ecto.Changeset{} = GpuModel.change_gpu(gpu)
    end
  end
end

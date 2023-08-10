defmodule Pcsite.ComputerTest do
  use Pcsite.DataCase

  alias Pcsite.Computer

  describe "computerparts" do
    alias Pcsite.Computer.ComputerParts

    import Pcsite.ComputerFixtures

    @invalid_attrs %{"\" cpu": nil}

    test "list_computerparts/0 returns all computerparts" do
      computer_parts = computer_parts_fixture()
      assert Computer.list_computerparts() == [computer_parts]
    end

    test "get_computer_parts!/1 returns the computer_parts with given id" do
      computer_parts = computer_parts_fixture()
      assert Computer.get_computer_parts!(computer_parts.id) == computer_parts
    end

    test "create_computer_parts/1 with valid data creates a computer_parts" do
      valid_attrs = %{"\" cpu": "some \" cpu"}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.create_computer_parts(valid_attrs)
      assert computer_parts." cpu == "some \" cpu"
    end

    test "create_computer_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_computer_parts(@invalid_attrs)
    end

    test "update_computer_parts/2 with valid data updates the computer_parts" do
      computer_parts = computer_parts_fixture()
      update_attrs = %{"\" cpu": "some updated \" cpu"}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.update_computer_parts(computer_parts, update_attrs)
      assert computer_parts." cpu == "some updated \" cpu"
    end

    test "update_computer_parts/2 with invalid data returns error changeset" do
      computer_parts = computer_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_computer_parts(computer_parts, @invalid_attrs)
      assert computer_parts == Computer.get_computer_parts!(computer_parts.id)
    end

    test "delete_computer_parts/1 deletes the computer_parts" do
      computer_parts = computer_parts_fixture()
      assert {:ok, %ComputerParts{}} = Computer.delete_computer_parts(computer_parts)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_computer_parts!(computer_parts.id) end
    end

    test "change_computer_parts/1 returns a computer_parts changeset" do
      computer_parts = computer_parts_fixture()
      assert %Ecto.Changeset{} = Computer.change_computer_parts(computer_parts)
    end
  end

  describe "computerparts" do
    alias Pcsite.Computer.ComputerParts

    import Pcsite.ComputerFixtures

    @invalid_attrs %{cpu: nil, memory: nil, status: nil, uuid: nil, gpu: nil, psu: nil, storage: nil, fans: nil, finalPrice: nil, invoiceCost: nil}

    test "list_computerparts/0 returns all computerparts" do
      computer_parts = computer_parts_fixture()
      assert Computer.list_computerparts() == [computer_parts]
    end

    test "get_computer_parts!/1 returns the computer_parts with given id" do
      computer_parts = computer_parts_fixture()
      assert Computer.get_computer_parts!(computer_parts.id) == computer_parts
    end

    test "create_computer_parts/1 with valid data creates a computer_parts" do
      valid_attrs = %{cpu: "some cpu", memory: "some memory", status: "some status", uuid: "some uuid", gpu: "some gpu", psu: "some psu", storage: ["option1", "option2"], fans: ["option1", "option2"], finalPrice: "some finalPrice", invoiceCost: "some invoiceCost"}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.create_computer_parts(valid_attrs)
      assert computer_parts.cpu == "some cpu"
      assert computer_parts.memory == "some memory"
      assert computer_parts.status == "some status"
      assert computer_parts.uuid == "some uuid"
      assert computer_parts.gpu == "some gpu"
      assert computer_parts.psu == "some psu"
      assert computer_parts.storage == ["option1", "option2"]
      assert computer_parts.fans == ["option1", "option2"]
      assert computer_parts.finalPrice == "some finalPrice"
      assert computer_parts.invoiceCost == "some invoiceCost"
    end

    test "create_computer_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_computer_parts(@invalid_attrs)
    end

    test "update_computer_parts/2 with valid data updates the computer_parts" do
      computer_parts = computer_parts_fixture()
      update_attrs = %{cpu: "some updated cpu", memory: "some updated memory", status: "some updated status", uuid: "some updated uuid", gpu: "some updated gpu", psu: "some updated psu", storage: ["option1"], fans: ["option1"], finalPrice: "some updated finalPrice", invoiceCost: "some updated invoiceCost"}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.update_computer_parts(computer_parts, update_attrs)
      assert computer_parts.cpu == "some updated cpu"
      assert computer_parts.memory == "some updated memory"
      assert computer_parts.status == "some updated status"
      assert computer_parts.uuid == "some updated uuid"
      assert computer_parts.gpu == "some updated gpu"
      assert computer_parts.psu == "some updated psu"
      assert computer_parts.storage == ["option1"]
      assert computer_parts.fans == ["option1"]
      assert computer_parts.finalPrice == "some updated finalPrice"
      assert computer_parts.invoiceCost == "some updated invoiceCost"
    end

    test "update_computer_parts/2 with invalid data returns error changeset" do
      computer_parts = computer_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_computer_parts(computer_parts, @invalid_attrs)
      assert computer_parts == Computer.get_computer_parts!(computer_parts.id)
    end

    test "delete_computer_parts/1 deletes the computer_parts" do
      computer_parts = computer_parts_fixture()
      assert {:ok, %ComputerParts{}} = Computer.delete_computer_parts(computer_parts)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_computer_parts!(computer_parts.id) end
    end

    test "change_computer_parts/1 returns a computer_parts changeset" do
      computer_parts = computer_parts_fixture()
      assert %Ecto.Changeset{} = Computer.change_computer_parts(computer_parts)
    end
  end

  describe "cpus" do
    alias Pcsite.Computer.Cpu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, cpuname: nil, cpuprice: nil, cpugeneration: nil}

    test "list_cpus/0 returns all cpus" do
      cpu = cpu_fixture()
      assert Computer.list_cpus() == [cpu]
    end

    test "get_cpu!/1 returns the cpu with given id" do
      cpu = cpu_fixture()
      assert Computer.get_cpu!(cpu.id) == cpu
    end

    test "create_cpu/1 with valid data creates a cpu" do
      valid_attrs = %{uuid: "some uuid", cpuname: "some cpuname", cpuprice: "some cpuprice", cpugeneration: "some cpugeneration"}

      assert {:ok, %Cpu{} = cpu} = Computer.create_cpu(valid_attrs)
      assert cpu.uuid == "some uuid"
      assert cpu.cpuname == "some cpuname"
      assert cpu.cpuprice == "some cpuprice"
      assert cpu.cpugeneration == "some cpugeneration"
    end

    test "create_cpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_cpu(@invalid_attrs)
    end

    test "update_cpu/2 with valid data updates the cpu" do
      cpu = cpu_fixture()
      update_attrs = %{uuid: "some updated uuid", cpuname: "some updated cpuname", cpuprice: "some updated cpuprice", cpugeneration: "some updated cpugeneration"}

      assert {:ok, %Cpu{} = cpu} = Computer.update_cpu(cpu, update_attrs)
      assert cpu.uuid == "some updated uuid"
      assert cpu.cpuname == "some updated cpuname"
      assert cpu.cpuprice == "some updated cpuprice"
      assert cpu.cpugeneration == "some updated cpugeneration"
    end

    test "update_cpu/2 with invalid data returns error changeset" do
      cpu = cpu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_cpu(cpu, @invalid_attrs)
      assert cpu == Computer.get_cpu!(cpu.id)
    end

    test "delete_cpu/1 deletes the cpu" do
      cpu = cpu_fixture()
      assert {:ok, %Cpu{}} = Computer.delete_cpu(cpu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_cpu!(cpu.id) end
    end

    test "change_cpu/1 returns a cpu changeset" do
      cpu = cpu_fixture()
      assert %Ecto.Changeset{} = Computer.change_cpu(cpu)
    end
  end

  describe "gpus" do
    alias Pcsite.Computer.Gpu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, gpuname: nil, gpuprice: nil, gpugeneration: nil}

    test "list_gpus/0 returns all gpus" do
      gpu = gpu_fixture()
      assert Computer.list_gpus() == [gpu]
    end

    test "get_gpu!/1 returns the gpu with given id" do
      gpu = gpu_fixture()
      assert Computer.get_gpu!(gpu.id) == gpu
    end

    test "create_gpu/1 with valid data creates a gpu" do
      valid_attrs = %{uuid: "some uuid", gpuname: "some gpuname", gpuprice: "some gpuprice", gpugeneration: "some gpugeneration"}

      assert {:ok, %Gpu{} = gpu} = Computer.create_gpu(valid_attrs)
      assert gpu.uuid == "some uuid"
      assert gpu.gpuname == "some gpuname"
      assert gpu.gpuprice == "some gpuprice"
      assert gpu.gpugeneration == "some gpugeneration"
    end

    test "create_gpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_gpu(@invalid_attrs)
    end

    test "update_gpu/2 with valid data updates the gpu" do
      gpu = gpu_fixture()
      update_attrs = %{uuid: "some updated uuid", gpuname: "some updated gpuname", gpuprice: "some updated gpuprice", gpugeneration: "some updated gpugeneration"}

      assert {:ok, %Gpu{} = gpu} = Computer.update_gpu(gpu, update_attrs)
      assert gpu.uuid == "some updated uuid"
      assert gpu.gpuname == "some updated gpuname"
      assert gpu.gpuprice == "some updated gpuprice"
      assert gpu.gpugeneration == "some updated gpugeneration"
    end

    test "update_gpu/2 with invalid data returns error changeset" do
      gpu = gpu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_gpu(gpu, @invalid_attrs)
      assert gpu == Computer.get_gpu!(gpu.id)
    end

    test "delete_gpu/1 deletes the gpu" do
      gpu = gpu_fixture()
      assert {:ok, %Gpu{}} = Computer.delete_gpu(gpu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_gpu!(gpu.id) end
    end

    test "change_gpu/1 returns a gpu changeset" do
      gpu = gpu_fixture()
      assert %Ecto.Changeset{} = Computer.change_gpu(gpu)
    end
  end

  describe "memorymodel" do
    alias Pcsite.Computer.Memory

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, memoryname: nil, memoryprice: nil, memorygeneration: nil, memoryManufacturer: nil}

    test "list_memorymodel/0 returns all memorymodel" do
      memory = memory_fixture()
      assert Computer.list_memorymodel() == [memory]
    end

    test "get_memory!/1 returns the memory with given id" do
      memory = memory_fixture()
      assert Computer.get_memory!(memory.id) == memory
    end

    test "create_memory/1 with valid data creates a memory" do
      valid_attrs = %{uuid: "some uuid", memoryname: "some memoryname", memoryprice: "some memoryprice", memorygeneration: "some memorygeneration", memoryManufacturer: "some memoryManufacturer"}

      assert {:ok, %Memory{} = memory} = Computer.create_memory(valid_attrs)
      assert memory.uuid == "some uuid"
      assert memory.memoryname == "some memoryname"
      assert memory.memoryprice == "some memoryprice"
      assert memory.memorygeneration == "some memorygeneration"
      assert memory.memoryManufacturer == "some memoryManufacturer"
    end

    test "create_memory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_memory(@invalid_attrs)
    end

    test "update_memory/2 with valid data updates the memory" do
      memory = memory_fixture()
      update_attrs = %{uuid: "some updated uuid", memoryname: "some updated memoryname", memoryprice: "some updated memoryprice", memorygeneration: "some updated memorygeneration", memoryManufacturer: "some updated memoryManufacturer"}

      assert {:ok, %Memory{} = memory} = Computer.update_memory(memory, update_attrs)
      assert memory.uuid == "some updated uuid"
      assert memory.memoryname == "some updated memoryname"
      assert memory.memoryprice == "some updated memoryprice"
      assert memory.memorygeneration == "some updated memorygeneration"
      assert memory.memoryManufacturer == "some updated memoryManufacturer"
    end

    test "update_memory/2 with invalid data returns error changeset" do
      memory = memory_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_memory(memory, @invalid_attrs)
      assert memory == Computer.get_memory!(memory.id)
    end

    test "delete_memory/1 deletes the memory" do
      memory = memory_fixture()
      assert {:ok, %Memory{}} = Computer.delete_memory(memory)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_memory!(memory.id) end
    end

    test "change_memory/1 returns a memory changeset" do
      memory = memory_fixture()
      assert %Ecto.Changeset{} = Computer.change_memory(memory)
    end
  end

  describe "psumodel" do
    alias Pcsite.Computer.Psu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, psuname: nil, psuprice: nil, psuManufacturer: nil, typeOfPsu: nil}

    test "list_psumodel/0 returns all psumodel" do
      psu = psu_fixture()
      assert Computer.list_psumodel() == [psu]
    end

    test "get_psu!/1 returns the psu with given id" do
      psu = psu_fixture()
      assert Computer.get_psu!(psu.id) == psu
    end

    test "create_psu/1 with valid data creates a psu" do
      valid_attrs = %{uuid: "some uuid", psuname: "some psuname", psuprice: "some psuprice", psuManufacturer: "some psuManufacturer", typeOfPsu: "some typeOfPsu"}

      assert {:ok, %Psu{} = psu} = Computer.create_psu(valid_attrs)
      assert psu.uuid == "some uuid"
      assert psu.psuname == "some psuname"
      assert psu.psuprice == "some psuprice"
      assert psu.psuManufacturer == "some psuManufacturer"
      assert psu.typeOfPsu == "some typeOfPsu"
    end

    test "create_psu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_psu(@invalid_attrs)
    end

    test "update_psu/2 with valid data updates the psu" do
      psu = psu_fixture()
      update_attrs = %{uuid: "some updated uuid", psuname: "some updated psuname", psuprice: "some updated psuprice", psuManufacturer: "some updated psuManufacturer", typeOfPsu: "some updated typeOfPsu"}

      assert {:ok, %Psu{} = psu} = Computer.update_psu(psu, update_attrs)
      assert psu.uuid == "some updated uuid"
      assert psu.psuname == "some updated psuname"
      assert psu.psuprice == "some updated psuprice"
      assert psu.psuManufacturer == "some updated psuManufacturer"
      assert psu.typeOfPsu == "some updated typeOfPsu"
    end

    test "update_psu/2 with invalid data returns error changeset" do
      psu = psu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_psu(psu, @invalid_attrs)
      assert psu == Computer.get_psu!(psu.id)
    end

    test "delete_psu/1 deletes the psu" do
      psu = psu_fixture()
      assert {:ok, %Psu{}} = Computer.delete_psu(psu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_psu!(psu.id) end
    end

    test "change_psu/1 returns a psu changeset" do
      psu = psu_fixture()
      assert %Ecto.Changeset{} = Computer.change_psu(psu)
    end
  end

  describe "storagemodel" do
    alias Pcsite.Computer.Storage

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, storagename: nil, storageprice: nil, storageManufacturer: nil, typeOfStorage: nil, nvme: nil, generation: nil}

    test "list_storagemodel/0 returns all storagemodel" do
      storage = storage_fixture()
      assert Computer.list_storagemodel() == [storage]
    end

    test "get_storage!/1 returns the storage with given id" do
      storage = storage_fixture()
      assert Computer.get_storage!(storage.id) == storage
    end

    test "create_storage/1 with valid data creates a storage" do
      valid_attrs = %{uuid: "some uuid", storagename: "some storagename", storageprice: "some storageprice", storageManufacturer: "some storageManufacturer", typeOfStorage: "some typeOfStorage", nvme: true, generation: "some generation"}

      assert {:ok, %Storage{} = storage} = Computer.create_storage(valid_attrs)
      assert storage.uuid == "some uuid"
      assert storage.storagename == "some storagename"
      assert storage.storageprice == "some storageprice"
      assert storage.storageManufacturer == "some storageManufacturer"
      assert storage.typeOfStorage == "some typeOfStorage"
      assert storage.nvme == true
      assert storage.generation == "some generation"
    end

    test "create_storage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_storage(@invalid_attrs)
    end

    test "update_storage/2 with valid data updates the storage" do
      storage = storage_fixture()
      update_attrs = %{uuid: "some updated uuid", storagename: "some updated storagename", storageprice: "some updated storageprice", storageManufacturer: "some updated storageManufacturer", typeOfStorage: "some updated typeOfStorage", nvme: false, generation: "some updated generation"}

      assert {:ok, %Storage{} = storage} = Computer.update_storage(storage, update_attrs)
      assert storage.uuid == "some updated uuid"
      assert storage.storagename == "some updated storagename"
      assert storage.storageprice == "some updated storageprice"
      assert storage.storageManufacturer == "some updated storageManufacturer"
      assert storage.typeOfStorage == "some updated typeOfStorage"
      assert storage.nvme == false
      assert storage.generation == "some updated generation"
    end

    test "update_storage/2 with invalid data returns error changeset" do
      storage = storage_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_storage(storage, @invalid_attrs)
      assert storage == Computer.get_storage!(storage.id)
    end

    test "delete_storage/1 deletes the storage" do
      storage = storage_fixture()
      assert {:ok, %Storage{}} = Computer.delete_storage(storage)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_storage!(storage.id) end
    end

    test "change_storage/1 returns a storage changeset" do
      storage = storage_fixture()
      assert %Ecto.Changeset{} = Computer.change_storage(storage)
    end
  end

  describe "computerparts" do
    alias Pcsite.Computer.ComputerParts

    import Pcsite.ComputerFixtures

    @invalid_attrs %{cpu: nil, memory: nil, status: nil, uuid: nil, gpu: nil, psu: nil, storage: nil, fans: nil, finalPrice: nil, invoiceCost: nil, dateCompleted: nil}

    test "list_computerparts/0 returns all computerparts" do
      computer_parts = computer_parts_fixture()
      assert Computer.list_computerparts() == [computer_parts]
    end

    test "get_computer_parts!/1 returns the computer_parts with given id" do
      computer_parts = computer_parts_fixture()
      assert Computer.get_computer_parts!(computer_parts.id) == computer_parts
    end

    test "create_computer_parts/1 with valid data creates a computer_parts" do
      valid_attrs = %{cpu: "some cpu", memory: "some memory", status: "some status", uuid: "some uuid", gpu: "some gpu", psu: "some psu", storage: ["option1", "option2"], fans: ["option1", "option2"], finalPrice: "some finalPrice", invoiceCost: "some invoiceCost", dateCompleted: ~N[2023-08-08 02:40:00]}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.create_computer_parts(valid_attrs)
      assert computer_parts.cpu == "some cpu"
      assert computer_parts.memory == "some memory"
      assert computer_parts.status == "some status"
      assert computer_parts.uuid == "some uuid"
      assert computer_parts.gpu == "some gpu"
      assert computer_parts.psu == "some psu"
      assert computer_parts.storage == ["option1", "option2"]
      assert computer_parts.fans == ["option1", "option2"]
      assert computer_parts.finalPrice == "some finalPrice"
      assert computer_parts.invoiceCost == "some invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-08 02:40:00]
    end

    test "create_computer_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_computer_parts(@invalid_attrs)
    end

    test "update_computer_parts/2 with valid data updates the computer_parts" do
      computer_parts = computer_parts_fixture()
      update_attrs = %{cpu: "some updated cpu", memory: "some updated memory", status: "some updated status", uuid: "some updated uuid", gpu: "some updated gpu", psu: "some updated psu", storage: ["option1"], fans: ["option1"], finalPrice: "some updated finalPrice", invoiceCost: "some updated invoiceCost", dateCompleted: ~N[2023-08-09 02:40:00]}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.update_computer_parts(computer_parts, update_attrs)
      assert computer_parts.cpu == "some updated cpu"
      assert computer_parts.memory == "some updated memory"
      assert computer_parts.status == "some updated status"
      assert computer_parts.uuid == "some updated uuid"
      assert computer_parts.gpu == "some updated gpu"
      assert computer_parts.psu == "some updated psu"
      assert computer_parts.storage == ["option1"]
      assert computer_parts.fans == ["option1"]
      assert computer_parts.finalPrice == "some updated finalPrice"
      assert computer_parts.invoiceCost == "some updated invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-09 02:40:00]
    end

    test "update_computer_parts/2 with invalid data returns error changeset" do
      computer_parts = computer_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_computer_parts(computer_parts, @invalid_attrs)
      assert computer_parts == Computer.get_computer_parts!(computer_parts.id)
    end

    test "delete_computer_parts/1 deletes the computer_parts" do
      computer_parts = computer_parts_fixture()
      assert {:ok, %ComputerParts{}} = Computer.delete_computer_parts(computer_parts)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_computer_parts!(computer_parts.id) end
    end

    test "change_computer_parts/1 returns a computer_parts changeset" do
      computer_parts = computer_parts_fixture()
      assert %Ecto.Changeset{} = Computer.change_computer_parts(computer_parts)
    end
  end

  describe "computerparts" do
    alias Pcsite.Computer.ComputerParts

    import Pcsite.ComputerFixtures

    @invalid_attrs %{cpu: nil, memory: nil, status: nil, uuid: nil, gpu: nil, psu: nil, storage: nil, fans: nil, finalPrice: nil, invoiceCost: nil, dateCompleted: nil, discontinued: nil, onSale: nil}

    test "list_computerparts/0 returns all computerparts" do
      computer_parts = computer_parts_fixture()
      assert Computer.list_computerparts() == [computer_parts]
    end

    test "get_computer_parts!/1 returns the computer_parts with given id" do
      computer_parts = computer_parts_fixture()
      assert Computer.get_computer_parts!(computer_parts.id) == computer_parts
    end

    test "create_computer_parts/1 with valid data creates a computer_parts" do
      valid_attrs = %{cpu: "some cpu", memory: "some memory", status: "some status", uuid: "some uuid", gpu: "some gpu", psu: "some psu", storage: ["option1", "option2"], fans: ["option1", "option2"], finalPrice: "some finalPrice", invoiceCost: "some invoiceCost", dateCompleted: ~N[2023-08-09 00:46:00], discontinued: true, onSale: true}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.create_computer_parts(valid_attrs)
      assert computer_parts.cpu == "some cpu"
      assert computer_parts.memory == "some memory"
      assert computer_parts.status == "some status"
      assert computer_parts.uuid == "some uuid"
      assert computer_parts.gpu == "some gpu"
      assert computer_parts.psu == "some psu"
      assert computer_parts.storage == ["option1", "option2"]
      assert computer_parts.fans == ["option1", "option2"]
      assert computer_parts.finalPrice == "some finalPrice"
      assert computer_parts.invoiceCost == "some invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-09 00:46:00]
      assert computer_parts.discontinued == true
      assert computer_parts.onSale == true
    end

    test "create_computer_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_computer_parts(@invalid_attrs)
    end

    test "update_computer_parts/2 with valid data updates the computer_parts" do
      computer_parts = computer_parts_fixture()
      update_attrs = %{cpu: "some updated cpu", memory: "some updated memory", status: "some updated status", uuid: "some updated uuid", gpu: "some updated gpu", psu: "some updated psu", storage: ["option1"], fans: ["option1"], finalPrice: "some updated finalPrice", invoiceCost: "some updated invoiceCost", dateCompleted: ~N[2023-08-10 00:46:00], discontinued: false, onSale: false}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.update_computer_parts(computer_parts, update_attrs)
      assert computer_parts.cpu == "some updated cpu"
      assert computer_parts.memory == "some updated memory"
      assert computer_parts.status == "some updated status"
      assert computer_parts.uuid == "some updated uuid"
      assert computer_parts.gpu == "some updated gpu"
      assert computer_parts.psu == "some updated psu"
      assert computer_parts.storage == ["option1"]
      assert computer_parts.fans == ["option1"]
      assert computer_parts.finalPrice == "some updated finalPrice"
      assert computer_parts.invoiceCost == "some updated invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-10 00:46:00]
      assert computer_parts.discontinued == false
      assert computer_parts.onSale == false
    end

    test "update_computer_parts/2 with invalid data returns error changeset" do
      computer_parts = computer_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_computer_parts(computer_parts, @invalid_attrs)
      assert computer_parts == Computer.get_computer_parts!(computer_parts.id)
    end

    test "delete_computer_parts/1 deletes the computer_parts" do
      computer_parts = computer_parts_fixture()
      assert {:ok, %ComputerParts{}} = Computer.delete_computer_parts(computer_parts)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_computer_parts!(computer_parts.id) end
    end

    test "change_computer_parts/1 returns a computer_parts changeset" do
      computer_parts = computer_parts_fixture()
      assert %Ecto.Changeset{} = Computer.change_computer_parts(computer_parts)
    end
  end

  describe "storage" do
    alias Pcsite.Computer.Storage

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, storagename: nil, storageprice: nil, storageManufacturer: nil, typeOfStorage: nil, nvme: nil, generation: nil}

    test "list_storage/0 returns all storage" do
      storage = storage_fixture()
      assert Computer.list_storage() == [storage]
    end

    test "get_storage!/1 returns the storage with given id" do
      storage = storage_fixture()
      assert Computer.get_storage!(storage.id) == storage
    end

    test "create_storage/1 with valid data creates a storage" do
      valid_attrs = %{uuid: "some uuid", storagename: "some storagename", storageprice: "some storageprice", storageManufacturer: "some storageManufacturer", typeOfStorage: "some typeOfStorage", nvme: true, generation: "some generation"}

      assert {:ok, %Storage{} = storage} = Computer.create_storage(valid_attrs)
      assert storage.uuid == "some uuid"
      assert storage.storagename == "some storagename"
      assert storage.storageprice == "some storageprice"
      assert storage.storageManufacturer == "some storageManufacturer"
      assert storage.typeOfStorage == "some typeOfStorage"
      assert storage.nvme == true
      assert storage.generation == "some generation"
    end

    test "create_storage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_storage(@invalid_attrs)
    end

    test "update_storage/2 with valid data updates the storage" do
      storage = storage_fixture()
      update_attrs = %{uuid: "some updated uuid", storagename: "some updated storagename", storageprice: "some updated storageprice", storageManufacturer: "some updated storageManufacturer", typeOfStorage: "some updated typeOfStorage", nvme: false, generation: "some updated generation"}

      assert {:ok, %Storage{} = storage} = Computer.update_storage(storage, update_attrs)
      assert storage.uuid == "some updated uuid"
      assert storage.storagename == "some updated storagename"
      assert storage.storageprice == "some updated storageprice"
      assert storage.storageManufacturer == "some updated storageManufacturer"
      assert storage.typeOfStorage == "some updated typeOfStorage"
      assert storage.nvme == false
      assert storage.generation == "some updated generation"
    end

    test "update_storage/2 with invalid data returns error changeset" do
      storage = storage_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_storage(storage, @invalid_attrs)
      assert storage == Computer.get_storage!(storage.id)
    end

    test "delete_storage/1 deletes the storage" do
      storage = storage_fixture()
      assert {:ok, %Storage{}} = Computer.delete_storage(storage)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_storage!(storage.id) end
    end

    test "change_storage/1 returns a storage changeset" do
      storage = storage_fixture()
      assert %Ecto.Changeset{} = Computer.change_storage(storage)
    end
  end

  describe "psu" do
    alias Pcsite.Computer.Psu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, psuname: nil, psuprice: nil, psuManufacturer: nil, typeOfPsu: nil}

    test "list_psu/0 returns all psu" do
      psu = psu_fixture()
      assert Computer.list_psu() == [psu]
    end

    test "get_psu!/1 returns the psu with given id" do
      psu = psu_fixture()
      assert Computer.get_psu!(psu.id) == psu
    end

    test "create_psu/1 with valid data creates a psu" do
      valid_attrs = %{uuid: "some uuid", psuname: "some psuname", psuprice: "some psuprice", psuManufacturer: "some psuManufacturer", typeOfPsu: "some typeOfPsu"}

      assert {:ok, %Psu{} = psu} = Computer.create_psu(valid_attrs)
      assert psu.uuid == "some uuid"
      assert psu.psuname == "some psuname"
      assert psu.psuprice == "some psuprice"
      assert psu.psuManufacturer == "some psuManufacturer"
      assert psu.typeOfPsu == "some typeOfPsu"
    end

    test "create_psu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_psu(@invalid_attrs)
    end

    test "update_psu/2 with valid data updates the psu" do
      psu = psu_fixture()
      update_attrs = %{uuid: "some updated uuid", psuname: "some updated psuname", psuprice: "some updated psuprice", psuManufacturer: "some updated psuManufacturer", typeOfPsu: "some updated typeOfPsu"}

      assert {:ok, %Psu{} = psu} = Computer.update_psu(psu, update_attrs)
      assert psu.uuid == "some updated uuid"
      assert psu.psuname == "some updated psuname"
      assert psu.psuprice == "some updated psuprice"
      assert psu.psuManufacturer == "some updated psuManufacturer"
      assert psu.typeOfPsu == "some updated typeOfPsu"
    end

    test "update_psu/2 with invalid data returns error changeset" do
      psu = psu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_psu(psu, @invalid_attrs)
      assert psu == Computer.get_psu!(psu.id)
    end

    test "delete_psu/1 deletes the psu" do
      psu = psu_fixture()
      assert {:ok, %Psu{}} = Computer.delete_psu(psu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_psu!(psu.id) end
    end

    test "change_psu/1 returns a psu changeset" do
      psu = psu_fixture()
      assert %Ecto.Changeset{} = Computer.change_psu(psu)
    end
  end

  describe "memory" do
    alias Pcsite.Computer.Memory

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, memoryname: nil, memoryprice: nil, memorygeneration: nil, memoryManufacturer: nil}

    test "list_memory/0 returns all memory" do
      memory = memory_fixture()
      assert Computer.list_memory() == [memory]
    end

    test "get_memory!/1 returns the memory with given id" do
      memory = memory_fixture()
      assert Computer.get_memory!(memory.id) == memory
    end

    test "create_memory/1 with valid data creates a memory" do
      valid_attrs = %{uuid: "some uuid", memoryname: "some memoryname", memoryprice: "some memoryprice", memorygeneration: "some memorygeneration", memoryManufacturer: "some memoryManufacturer"}

      assert {:ok, %Memory{} = memory} = Computer.create_memory(valid_attrs)
      assert memory.uuid == "some uuid"
      assert memory.memoryname == "some memoryname"
      assert memory.memoryprice == "some memoryprice"
      assert memory.memorygeneration == "some memorygeneration"
      assert memory.memoryManufacturer == "some memoryManufacturer"
    end

    test "create_memory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_memory(@invalid_attrs)
    end

    test "update_memory/2 with valid data updates the memory" do
      memory = memory_fixture()
      update_attrs = %{uuid: "some updated uuid", memoryname: "some updated memoryname", memoryprice: "some updated memoryprice", memorygeneration: "some updated memorygeneration", memoryManufacturer: "some updated memoryManufacturer"}

      assert {:ok, %Memory{} = memory} = Computer.update_memory(memory, update_attrs)
      assert memory.uuid == "some updated uuid"
      assert memory.memoryname == "some updated memoryname"
      assert memory.memoryprice == "some updated memoryprice"
      assert memory.memorygeneration == "some updated memorygeneration"
      assert memory.memoryManufacturer == "some updated memoryManufacturer"
    end

    test "update_memory/2 with invalid data returns error changeset" do
      memory = memory_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_memory(memory, @invalid_attrs)
      assert memory == Computer.get_memory!(memory.id)
    end

    test "delete_memory/1 deletes the memory" do
      memory = memory_fixture()
      assert {:ok, %Memory{}} = Computer.delete_memory(memory)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_memory!(memory.id) end
    end

    test "change_memory/1 returns a memory changeset" do
      memory = memory_fixture()
      assert %Ecto.Changeset{} = Computer.change_memory(memory)
    end
  end

  describe "gpu" do
    alias Pcsite.Computer.Gpu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, gpuname: nil, gpuprice: nil, gpugeneration: nil}

    test "list_gpu/0 returns all gpu" do
      gpu = gpu_fixture()
      assert Computer.list_gpu() == [gpu]
    end

    test "get_gpu!/1 returns the gpu with given id" do
      gpu = gpu_fixture()
      assert Computer.get_gpu!(gpu.id) == gpu
    end

    test "create_gpu/1 with valid data creates a gpu" do
      valid_attrs = %{uuid: "some uuid", gpuname: "some gpuname", gpuprice: "some gpuprice", gpugeneration: "some gpugeneration"}

      assert {:ok, %Gpu{} = gpu} = Computer.create_gpu(valid_attrs)
      assert gpu.uuid == "some uuid"
      assert gpu.gpuname == "some gpuname"
      assert gpu.gpuprice == "some gpuprice"
      assert gpu.gpugeneration == "some gpugeneration"
    end

    test "create_gpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_gpu(@invalid_attrs)
    end

    test "update_gpu/2 with valid data updates the gpu" do
      gpu = gpu_fixture()
      update_attrs = %{uuid: "some updated uuid", gpuname: "some updated gpuname", gpuprice: "some updated gpuprice", gpugeneration: "some updated gpugeneration"}

      assert {:ok, %Gpu{} = gpu} = Computer.update_gpu(gpu, update_attrs)
      assert gpu.uuid == "some updated uuid"
      assert gpu.gpuname == "some updated gpuname"
      assert gpu.gpuprice == "some updated gpuprice"
      assert gpu.gpugeneration == "some updated gpugeneration"
    end

    test "update_gpu/2 with invalid data returns error changeset" do
      gpu = gpu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_gpu(gpu, @invalid_attrs)
      assert gpu == Computer.get_gpu!(gpu.id)
    end

    test "delete_gpu/1 deletes the gpu" do
      gpu = gpu_fixture()
      assert {:ok, %Gpu{}} = Computer.delete_gpu(gpu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_gpu!(gpu.id) end
    end

    test "change_gpu/1 returns a gpu changeset" do
      gpu = gpu_fixture()
      assert %Ecto.Changeset{} = Computer.change_gpu(gpu)
    end
  end

  describe "cpu" do
    alias Pcsite.Computer.Cpu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, cpuname: nil, cpuprice: nil, cpugeneration: nil}

    test "list_cpu/0 returns all cpu" do
      cpu = cpu_fixture()
      assert Computer.list_cpu() == [cpu]
    end

    test "get_cpu!/1 returns the cpu with given id" do
      cpu = cpu_fixture()
      assert Computer.get_cpu!(cpu.id) == cpu
    end

    test "create_cpu/1 with valid data creates a cpu" do
      valid_attrs = %{uuid: "some uuid", cpuname: "some cpuname", cpuprice: "some cpuprice", cpugeneration: "some cpugeneration"}

      assert {:ok, %Cpu{} = cpu} = Computer.create_cpu(valid_attrs)
      assert cpu.uuid == "some uuid"
      assert cpu.cpuname == "some cpuname"
      assert cpu.cpuprice == "some cpuprice"
      assert cpu.cpugeneration == "some cpugeneration"
    end

    test "create_cpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_cpu(@invalid_attrs)
    end

    test "update_cpu/2 with valid data updates the cpu" do
      cpu = cpu_fixture()
      update_attrs = %{uuid: "some updated uuid", cpuname: "some updated cpuname", cpuprice: "some updated cpuprice", cpugeneration: "some updated cpugeneration"}

      assert {:ok, %Cpu{} = cpu} = Computer.update_cpu(cpu, update_attrs)
      assert cpu.uuid == "some updated uuid"
      assert cpu.cpuname == "some updated cpuname"
      assert cpu.cpuprice == "some updated cpuprice"
      assert cpu.cpugeneration == "some updated cpugeneration"
    end

    test "update_cpu/2 with invalid data returns error changeset" do
      cpu = cpu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_cpu(cpu, @invalid_attrs)
      assert cpu == Computer.get_cpu!(cpu.id)
    end

    test "delete_cpu/1 deletes the cpu" do
      cpu = cpu_fixture()
      assert {:ok, %Cpu{}} = Computer.delete_cpu(cpu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_cpu!(cpu.id) end
    end

    test "change_cpu/1 returns a cpu changeset" do
      cpu = cpu_fixture()
      assert %Ecto.Changeset{} = Computer.change_cpu(cpu)
    end
  end

  describe "computerparts" do
    alias Pcsite.Computer.ComputerParts

    import Pcsite.ComputerFixtures

    @invalid_attrs %{cpu: nil, disabled: nil, memory: nil, status: nil, uuid: nil, gpu: nil, psu: nil, storage: nil, fans: nil, finalPrice: nil, invoiceCost: nil, dateCompleted: nil, onSale: nil}

    test "list_computerparts/0 returns all computerparts" do
      computer_parts = computer_parts_fixture()
      assert Computer.list_computerparts() == [computer_parts]
    end

    test "get_computer_parts!/1 returns the computer_parts with given id" do
      computer_parts = computer_parts_fixture()
      assert Computer.get_computer_parts!(computer_parts.id) == computer_parts
    end

    test "create_computer_parts/1 with valid data creates a computer_parts" do
      valid_attrs = %{cpu: "some cpu", disabled: true, memory: "some memory", status: "some status", uuid: "some uuid", gpu: "some gpu", psu: "some psu", storage: ["option1", "option2"], fans: ["option1", "option2"], finalPrice: "some finalPrice", invoiceCost: "some invoiceCost", dateCompleted: ~N[2023-08-09 00:56:00], onSale: true}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.create_computer_parts(valid_attrs)
      assert computer_parts.cpu == "some cpu"
      assert computer_parts.disabled == true
      assert computer_parts.memory == "some memory"
      assert computer_parts.status == "some status"
      assert computer_parts.uuid == "some uuid"
      assert computer_parts.gpu == "some gpu"
      assert computer_parts.psu == "some psu"
      assert computer_parts.storage == ["option1", "option2"]
      assert computer_parts.fans == ["option1", "option2"]
      assert computer_parts.finalPrice == "some finalPrice"
      assert computer_parts.invoiceCost == "some invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-09 00:56:00]
      assert computer_parts.onSale == true
    end

    test "create_computer_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_computer_parts(@invalid_attrs)
    end

    test "update_computer_parts/2 with valid data updates the computer_parts" do
      computer_parts = computer_parts_fixture()
      update_attrs = %{cpu: "some updated cpu", disabled: false, memory: "some updated memory", status: "some updated status", uuid: "some updated uuid", gpu: "some updated gpu", psu: "some updated psu", storage: ["option1"], fans: ["option1"], finalPrice: "some updated finalPrice", invoiceCost: "some updated invoiceCost", dateCompleted: ~N[2023-08-10 00:56:00], onSale: false}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.update_computer_parts(computer_parts, update_attrs)
      assert computer_parts.cpu == "some updated cpu"
      assert computer_parts.disabled == false
      assert computer_parts.memory == "some updated memory"
      assert computer_parts.status == "some updated status"
      assert computer_parts.uuid == "some updated uuid"
      assert computer_parts.gpu == "some updated gpu"
      assert computer_parts.psu == "some updated psu"
      assert computer_parts.storage == ["option1"]
      assert computer_parts.fans == ["option1"]
      assert computer_parts.finalPrice == "some updated finalPrice"
      assert computer_parts.invoiceCost == "some updated invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-10 00:56:00]
      assert computer_parts.onSale == false
    end

    test "update_computer_parts/2 with invalid data returns error changeset" do
      computer_parts = computer_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_computer_parts(computer_parts, @invalid_attrs)
      assert computer_parts == Computer.get_computer_parts!(computer_parts.id)
    end

    test "delete_computer_parts/1 deletes the computer_parts" do
      computer_parts = computer_parts_fixture()
      assert {:ok, %ComputerParts{}} = Computer.delete_computer_parts(computer_parts)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_computer_parts!(computer_parts.id) end
    end

    test "change_computer_parts/1 returns a computer_parts changeset" do
      computer_parts = computer_parts_fixture()
      assert %Ecto.Changeset{} = Computer.change_computer_parts(computer_parts)
    end
  end

  describe "motherboard" do
    alias Pcsite.Computer.Motherboard

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, motherboardname: nil, motherboardprice: nil, motherboardManufacturer: nil, typeOfMotherboard: nil, nvme: nil, motherboardGeneration: nil}

    test "list_motherboard/0 returns all motherboard" do
      motherboard = motherboard_fixture()
      assert Computer.list_motherboard() == [motherboard]
    end

    test "get_motherboard!/1 returns the motherboard with given id" do
      motherboard = motherboard_fixture()
      assert Computer.get_motherboard!(motherboard.id) == motherboard
    end

    test "create_motherboard/1 with valid data creates a motherboard" do
      valid_attrs = %{uuid: "some uuid", motherboardname: "some motherboardname", motherboardprice: "some motherboardprice", motherboardManufacturer: "some motherboardManufacturer", typeOfMotherboard: "some typeOfMotherboard", nvme: true, motherboardGeneration: "some motherboardGeneration"}

      assert {:ok, %Motherboard{} = motherboard} = Computer.create_motherboard(valid_attrs)
      assert motherboard.uuid == "some uuid"
      assert motherboard.motherboardname == "some motherboardname"
      assert motherboard.motherboardprice == "some motherboardprice"
      assert motherboard.motherboardManufacturer == "some motherboardManufacturer"
      assert motherboard.typeOfMotherboard == "some typeOfMotherboard"
      assert motherboard.nvme == true
      assert motherboard.motherboardGeneration == "some motherboardGeneration"
    end

    test "create_motherboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_motherboard(@invalid_attrs)
    end

    test "update_motherboard/2 with valid data updates the motherboard" do
      motherboard = motherboard_fixture()
      update_attrs = %{uuid: "some updated uuid", motherboardname: "some updated motherboardname", motherboardprice: "some updated motherboardprice", motherboardManufacturer: "some updated motherboardManufacturer", typeOfMotherboard: "some updated typeOfMotherboard", nvme: false, motherboardGeneration: "some updated motherboardGeneration"}

      assert {:ok, %Motherboard{} = motherboard} = Computer.update_motherboard(motherboard, update_attrs)
      assert motherboard.uuid == "some updated uuid"
      assert motherboard.motherboardname == "some updated motherboardname"
      assert motherboard.motherboardprice == "some updated motherboardprice"
      assert motherboard.motherboardManufacturer == "some updated motherboardManufacturer"
      assert motherboard.typeOfMotherboard == "some updated typeOfMotherboard"
      assert motherboard.nvme == false
      assert motherboard.motherboardGeneration == "some updated motherboardGeneration"
    end

    test "update_motherboard/2 with invalid data returns error changeset" do
      motherboard = motherboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_motherboard(motherboard, @invalid_attrs)
      assert motherboard == Computer.get_motherboard!(motherboard.id)
    end

    test "delete_motherboard/1 deletes the motherboard" do
      motherboard = motherboard_fixture()
      assert {:ok, %Motherboard{}} = Computer.delete_motherboard(motherboard)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_motherboard!(motherboard.id) end
    end

    test "change_motherboard/1 returns a motherboard changeset" do
      motherboard = motherboard_fixture()
      assert %Ecto.Changeset{} = Computer.change_motherboard(motherboard)
    end
  end

  describe "motherboard" do
    alias Pcsite.Computer.Motherboard

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, motherboardname: nil, motherboardprice: nil, motherboardManufacturer: nil, typeOfMotherboard: nil, nvme: nil, motherboardGeneration: nil, chipset: nil}

    test "list_motherboard/0 returns all motherboard" do
      motherboard = motherboard_fixture()
      assert Computer.list_motherboard() == [motherboard]
    end

    test "get_motherboard!/1 returns the motherboard with given id" do
      motherboard = motherboard_fixture()
      assert Computer.get_motherboard!(motherboard.id) == motherboard
    end

    test "create_motherboard/1 with valid data creates a motherboard" do
      valid_attrs = %{uuid: "some uuid", motherboardname: "some motherboardname", motherboardprice: "some motherboardprice", motherboardManufacturer: "some motherboardManufacturer", typeOfMotherboard: "some typeOfMotherboard", nvme: true, motherboardGeneration: "some motherboardGeneration", chipset: "some chipset"}

      assert {:ok, %Motherboard{} = motherboard} = Computer.create_motherboard(valid_attrs)
      assert motherboard.uuid == "some uuid"
      assert motherboard.motherboardname == "some motherboardname"
      assert motherboard.motherboardprice == "some motherboardprice"
      assert motherboard.motherboardManufacturer == "some motherboardManufacturer"
      assert motherboard.typeOfMotherboard == "some typeOfMotherboard"
      assert motherboard.nvme == true
      assert motherboard.motherboardGeneration == "some motherboardGeneration"
      assert motherboard.chipset == "some chipset"
    end

    test "create_motherboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_motherboard(@invalid_attrs)
    end

    test "update_motherboard/2 with valid data updates the motherboard" do
      motherboard = motherboard_fixture()
      update_attrs = %{uuid: "some updated uuid", motherboardname: "some updated motherboardname", motherboardprice: "some updated motherboardprice", motherboardManufacturer: "some updated motherboardManufacturer", typeOfMotherboard: "some updated typeOfMotherboard", nvme: false, motherboardGeneration: "some updated motherboardGeneration", chipset: "some updated chipset"}

      assert {:ok, %Motherboard{} = motherboard} = Computer.update_motherboard(motherboard, update_attrs)
      assert motherboard.uuid == "some updated uuid"
      assert motherboard.motherboardname == "some updated motherboardname"
      assert motherboard.motherboardprice == "some updated motherboardprice"
      assert motherboard.motherboardManufacturer == "some updated motherboardManufacturer"
      assert motherboard.typeOfMotherboard == "some updated typeOfMotherboard"
      assert motherboard.nvme == false
      assert motherboard.motherboardGeneration == "some updated motherboardGeneration"
      assert motherboard.chipset == "some updated chipset"
    end

    test "update_motherboard/2 with invalid data returns error changeset" do
      motherboard = motherboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_motherboard(motherboard, @invalid_attrs)
      assert motherboard == Computer.get_motherboard!(motherboard.id)
    end

    test "delete_motherboard/1 deletes the motherboard" do
      motherboard = motherboard_fixture()
      assert {:ok, %Motherboard{}} = Computer.delete_motherboard(motherboard)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_motherboard!(motherboard.id) end
    end

    test "change_motherboard/1 returns a motherboard changeset" do
      motherboard = motherboard_fixture()
      assert %Ecto.Changeset{} = Computer.change_motherboard(motherboard)
    end
  end

  describe "computerparts" do
    alias Pcsite.Computer.ComputerParts

    import Pcsite.ComputerFixtures

    @invalid_attrs %{cpu: nil, memory: nil, status: nil, uuid: nil, gpu: nil, psu: nil, storage: nil, fans: nil, finalPrice: nil, invoiceCost: nil, dateCompleted: nil, discontinued: nil, onSale: nil}

    test "list_computerparts/0 returns all computerparts" do
      computer_parts = computer_parts_fixture()
      assert Computer.list_computerparts() == [computer_parts]
    end

    test "get_computer_parts!/1 returns the computer_parts with given id" do
      computer_parts = computer_parts_fixture()
      assert Computer.get_computer_parts!(computer_parts.id) == computer_parts
    end

    test "create_computer_parts/1 with valid data creates a computer_parts" do
      valid_attrs = %{cpu: "some cpu", memory: "some memory", status: "some status", uuid: "some uuid", gpu: "some gpu", psu: "some psu", storage: ["option1", "option2"], fans: ["option1", "option2"], finalPrice: "some finalPrice", invoiceCost: "some invoiceCost", dateCompleted: ~N[2023-08-09 01:02:00], discontinued: true, onSale: true}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.create_computer_parts(valid_attrs)
      assert computer_parts.cpu == "some cpu"
      assert computer_parts.memory == "some memory"
      assert computer_parts.status == "some status"
      assert computer_parts.uuid == "some uuid"
      assert computer_parts.gpu == "some gpu"
      assert computer_parts.psu == "some psu"
      assert computer_parts.storage == ["option1", "option2"]
      assert computer_parts.fans == ["option1", "option2"]
      assert computer_parts.finalPrice == "some finalPrice"
      assert computer_parts.invoiceCost == "some invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-09 01:02:00]
      assert computer_parts.discontinued == true
      assert computer_parts.onSale == true
    end

    test "create_computer_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_computer_parts(@invalid_attrs)
    end

    test "update_computer_parts/2 with valid data updates the computer_parts" do
      computer_parts = computer_parts_fixture()
      update_attrs = %{cpu: "some updated cpu", memory: "some updated memory", status: "some updated status", uuid: "some updated uuid", gpu: "some updated gpu", psu: "some updated psu", storage: ["option1"], fans: ["option1"], finalPrice: "some updated finalPrice", invoiceCost: "some updated invoiceCost", dateCompleted: ~N[2023-08-10 01:02:00], discontinued: false, onSale: false}

      assert {:ok, %ComputerParts{} = computer_parts} = Computer.update_computer_parts(computer_parts, update_attrs)
      assert computer_parts.cpu == "some updated cpu"
      assert computer_parts.memory == "some updated memory"
      assert computer_parts.status == "some updated status"
      assert computer_parts.uuid == "some updated uuid"
      assert computer_parts.gpu == "some updated gpu"
      assert computer_parts.psu == "some updated psu"
      assert computer_parts.storage == ["option1"]
      assert computer_parts.fans == ["option1"]
      assert computer_parts.finalPrice == "some updated finalPrice"
      assert computer_parts.invoiceCost == "some updated invoiceCost"
      assert computer_parts.dateCompleted == ~N[2023-08-10 01:02:00]
      assert computer_parts.discontinued == false
      assert computer_parts.onSale == false
    end

    test "update_computer_parts/2 with invalid data returns error changeset" do
      computer_parts = computer_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_computer_parts(computer_parts, @invalid_attrs)
      assert computer_parts == Computer.get_computer_parts!(computer_parts.id)
    end

    test "delete_computer_parts/1 deletes the computer_parts" do
      computer_parts = computer_parts_fixture()
      assert {:ok, %ComputerParts{}} = Computer.delete_computer_parts(computer_parts)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_computer_parts!(computer_parts.id) end
    end

    test "change_computer_parts/1 returns a computer_parts changeset" do
      computer_parts = computer_parts_fixture()
      assert %Ecto.Changeset{} = Computer.change_computer_parts(computer_parts)
    end
  end

  describe "cpu" do
    alias Pcsite.Computer.Cpu

    import Pcsite.ComputerFixtures

    @invalid_attrs %{uuid: nil, cpuname: nil, cpuprice: nil, cpugeneration: nil, allowedMotherboardChipset: nil}

    test "list_cpu/0 returns all cpu" do
      cpu = cpu_fixture()
      assert Computer.list_cpu() == [cpu]
    end

    test "get_cpu!/1 returns the cpu with given id" do
      cpu = cpu_fixture()
      assert Computer.get_cpu!(cpu.id) == cpu
    end

    test "create_cpu/1 with valid data creates a cpu" do
      valid_attrs = %{uuid: "some uuid", cpuname: "some cpuname", cpuprice: "some cpuprice", cpugeneration: "some cpugeneration", allowedMotherboardChipset: ["option1", "option2"]}

      assert {:ok, %Cpu{} = cpu} = Computer.create_cpu(valid_attrs)
      assert cpu.uuid == "some uuid"
      assert cpu.cpuname == "some cpuname"
      assert cpu.cpuprice == "some cpuprice"
      assert cpu.cpugeneration == "some cpugeneration"
      assert cpu.allowedMotherboardChipset == ["option1", "option2"]
    end

    test "create_cpu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computer.create_cpu(@invalid_attrs)
    end

    test "update_cpu/2 with valid data updates the cpu" do
      cpu = cpu_fixture()
      update_attrs = %{uuid: "some updated uuid", cpuname: "some updated cpuname", cpuprice: "some updated cpuprice", cpugeneration: "some updated cpugeneration", allowedMotherboardChipset: ["option1"]}

      assert {:ok, %Cpu{} = cpu} = Computer.update_cpu(cpu, update_attrs)
      assert cpu.uuid == "some updated uuid"
      assert cpu.cpuname == "some updated cpuname"
      assert cpu.cpuprice == "some updated cpuprice"
      assert cpu.cpugeneration == "some updated cpugeneration"
      assert cpu.allowedMotherboardChipset == ["option1"]
    end

    test "update_cpu/2 with invalid data returns error changeset" do
      cpu = cpu_fixture()
      assert {:error, %Ecto.Changeset{}} = Computer.update_cpu(cpu, @invalid_attrs)
      assert cpu == Computer.get_cpu!(cpu.id)
    end

    test "delete_cpu/1 deletes the cpu" do
      cpu = cpu_fixture()
      assert {:ok, %Cpu{}} = Computer.delete_cpu(cpu)
      assert_raise Ecto.NoResultsError, fn -> Computer.get_cpu!(cpu.id) end
    end

    test "change_cpu/1 returns a cpu changeset" do
      cpu = cpu_fixture()
      assert %Ecto.Changeset{} = Computer.change_cpu(cpu)
    end
  end
end

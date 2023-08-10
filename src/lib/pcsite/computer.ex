defmodule Pcsite.Computer do
  @moduledoc """
  The Computer context.
  """

  import Ecto.Query, warn: false
  alias Pcsite.Repo

  alias Pcsite.Computer.Motherboard

  @doc """
  Returns the list of motherboard.

  ## Examples

      iex> list_motherboard()
      [%Motherboard{}, ...]

  """
  def list_motherboard do
    Repo.all(Motherboard)
  end

  @doc """
  Gets a single motherboard.

  Raises `Ecto.NoResultsError` if the Motherboard does not exist.

  ## Examples

      iex> get_motherboard!(123)
      %Motherboard{}

      iex> get_motherboard!(456)
      ** (Ecto.NoResultsError)

  """
  def get_motherboard!(id), do: Repo.get!(Motherboard, id)

  @doc """
  Creates a motherboard.

  ## Examples

      iex> create_motherboard(%{field: value})
      {:ok, %Motherboard{}}

      iex> create_motherboard(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_motherboard(attrs \\ %{}) do
    %Motherboard{}
    |> Motherboard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a motherboard.

  ## Examples

      iex> update_motherboard(motherboard, %{field: new_value})
      {:ok, %Motherboard{}}

      iex> update_motherboard(motherboard, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_motherboard(%Motherboard{} = motherboard, attrs) do
    motherboard
    |> Motherboard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a motherboard.

  ## Examples

      iex> delete_motherboard(motherboard)
      {:ok, %Motherboard{}}

      iex> delete_motherboard(motherboard)
      {:error, %Ecto.Changeset{}}

  """
  def delete_motherboard(%Motherboard{} = motherboard) do
    Repo.delete(motherboard)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking motherboard changes.

  ## Examples

      iex> change_motherboard(motherboard)
      %Ecto.Changeset{data: %Motherboard{}}

  """
  def change_motherboard(%Motherboard{} = motherboard, attrs \\ %{}) do
    Motherboard.changeset(motherboard, attrs)
  end

  alias Pcsite.Computer.ComputerParts

  @doc """
  Returns the list of computerparts.

  ## Examples

      iex> list_computerparts()
      [%ComputerParts{}, ...]

  """
  def list_computerparts do
    Repo.all(ComputerParts)
  end

  @doc """
  Gets a single computer_parts.

  Raises `Ecto.NoResultsError` if the Computer parts does not exist.

  ## Examples

      iex> get_computer_parts!(123)
      %ComputerParts{}

      iex> get_computer_parts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_computer_parts!(id), do: Repo.get!(ComputerParts, id)

  @doc """
  Creates a computer_parts.

  ## Examples

      iex> create_computer_parts(%{field: value})
      {:ok, %ComputerParts{}}

      iex> create_computer_parts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_computer_parts(attrs \\ %{}) do
    %ComputerParts{}
    |> ComputerParts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a computer_parts.

  ## Examples

      iex> update_computer_parts(computer_parts, %{field: new_value})
      {:ok, %ComputerParts{}}

      iex> update_computer_parts(computer_parts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_computer_parts(%ComputerParts{} = computer_parts, attrs) do
    computer_parts
    |> ComputerParts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a computer_parts.

  ## Examples

      iex> delete_computer_parts(computer_parts)
      {:ok, %ComputerParts{}}

      iex> delete_computer_parts(computer_parts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_computer_parts(%ComputerParts{} = computer_parts) do
    Repo.delete(computer_parts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking computer_parts changes.

  ## Examples

      iex> change_computer_parts(computer_parts)
      %Ecto.Changeset{data: %ComputerParts{}}

  """
  def change_computer_parts(%ComputerParts{} = computer_parts, attrs \\ %{}) do
    ComputerParts.changeset(computer_parts, attrs)
  end

  alias Pcsite.Computer.Cpu

  @doc """
  Returns the list of cpu.

  ## Examples

      iex> list_cpu()
      [%Cpu{}, ...]

  """
  def list_cpu do
    Repo.all(Cpu)
  end

  @doc """
  Gets a single cpu.

  Raises `Ecto.NoResultsError` if the Cpu does not exist.

  ## Examples

      iex> get_cpu!(123)
      %Cpu{}

      iex> get_cpu!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cpu!(id), do: Repo.get!(Cpu, id)

  @doc """
  Creates a cpu.

  ## Examples

      iex> create_cpu(%{field: value})
      {:ok, %Cpu{}}

      iex> create_cpu(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cpu(attrs \\ %{}) do
    %Cpu{}
    |> Cpu.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cpu.

  ## Examples

      iex> update_cpu(cpu, %{field: new_value})
      {:ok, %Cpu{}}

      iex> update_cpu(cpu, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cpu(%Cpu{} = cpu, attrs) do
    cpu
    |> Cpu.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cpu.

  ## Examples

      iex> delete_cpu(cpu)
      {:ok, %Cpu{}}

      iex> delete_cpu(cpu)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cpu(%Cpu{} = cpu) do
    Repo.delete(cpu)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cpu changes.

  ## Examples

      iex> change_cpu(cpu)
      %Ecto.Changeset{data: %Cpu{}}

  """
  def change_cpu(%Cpu{} = cpu, attrs \\ %{}) do
    Cpu.changeset(cpu, attrs)
  end

  alias Pcsite.Computer.Storage

  @doc """
  Returns the list of storage.

  ## Examples

      iex> list_storage()
      [%Storage{}, ...]

  """
  def list_storage do
    Repo.all(Storage)
  end

  @doc """
  Gets a single storage.

  Raises `Ecto.NoResultsError` if the Storage does not exist.

  ## Examples

      iex> get_storage!(123)
      %Storage{}

      iex> get_storage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_storage!(id), do: Repo.get!(Storage, id)

  @doc """
  Creates a storage.

  ## Examples

      iex> create_storage(%{field: value})
      {:ok, %Storage{}}

      iex> create_storage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_storage(attrs \\ %{}) do
    %Storage{}
    |> Storage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a storage.

  ## Examples

      iex> update_storage(storage, %{field: new_value})
      {:ok, %Storage{}}

      iex> update_storage(storage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_storage(%Storage{} = storage, attrs) do
    storage
    |> Storage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a storage.

  ## Examples

      iex> delete_storage(storage)
      {:ok, %Storage{}}

      iex> delete_storage(storage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_storage(%Storage{} = storage) do
    Repo.delete(storage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking storage changes.

  ## Examples

      iex> change_storage(storage)
      %Ecto.Changeset{data: %Storage{}}

  """
  def change_storage(%Storage{} = storage, attrs \\ %{}) do
    Storage.changeset(storage, attrs)
  end

  alias Pcsite.Computer.Psu

  @doc """
  Returns the list of psu.

  ## Examples

      iex> list_psu()
      [%Psu{}, ...]

  """
  def list_psu do
    Repo.all(Psu)
  end

  @doc """
  Gets a single psu.

  Raises `Ecto.NoResultsError` if the Psu does not exist.

  ## Examples

      iex> get_psu!(123)
      %Psu{}

      iex> get_psu!(456)
      ** (Ecto.NoResultsError)

  """
  def get_psu!(id), do: Repo.get!(Psu, id)

  @doc """
  Creates a psu.

  ## Examples

      iex> create_psu(%{field: value})
      {:ok, %Psu{}}

      iex> create_psu(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_psu(attrs \\ %{}) do
    %Psu{}
    |> Psu.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a psu.

  ## Examples

      iex> update_psu(psu, %{field: new_value})
      {:ok, %Psu{}}

      iex> update_psu(psu, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_psu(%Psu{} = psu, attrs) do
    psu
    |> Psu.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a psu.

  ## Examples

      iex> delete_psu(psu)
      {:ok, %Psu{}}

      iex> delete_psu(psu)
      {:error, %Ecto.Changeset{}}

  """
  def delete_psu(%Psu{} = psu) do
    Repo.delete(psu)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking psu changes.

  ## Examples

      iex> change_psu(psu)
      %Ecto.Changeset{data: %Psu{}}

  """
  def change_psu(%Psu{} = psu, attrs \\ %{}) do
    Psu.changeset(psu, attrs)
  end

  alias Pcsite.Computer.Memory

  @doc """
  Returns the list of memory.

  ## Examples

      iex> list_memory()
      [%Memory{}, ...]

  """
  def list_memory do
    Repo.all(Memory)
  end

  @doc """
  Gets a single memory.

  Raises `Ecto.NoResultsError` if the Memory does not exist.

  ## Examples

      iex> get_memory!(123)
      %Memory{}

      iex> get_memory!(456)
      ** (Ecto.NoResultsError)

  """
  def get_memory!(id), do: Repo.get!(Memory, id)

  @doc """
  Creates a memory.

  ## Examples

      iex> create_memory(%{field: value})
      {:ok, %Memory{}}

      iex> create_memory(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_memory(attrs \\ %{}) do
    %Memory{}
    |> Memory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a memory.

  ## Examples

      iex> update_memory(memory, %{field: new_value})
      {:ok, %Memory{}}

      iex> update_memory(memory, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_memory(%Memory{} = memory, attrs) do
    memory
    |> Memory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a memory.

  ## Examples

      iex> delete_memory(memory)
      {:ok, %Memory{}}

      iex> delete_memory(memory)
      {:error, %Ecto.Changeset{}}

  """
  def delete_memory(%Memory{} = memory) do
    Repo.delete(memory)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking memory changes.

  ## Examples

      iex> change_memory(memory)
      %Ecto.Changeset{data: %Memory{}}

  """
  def change_memory(%Memory{} = memory, attrs \\ %{}) do
    Memory.changeset(memory, attrs)
  end

  alias Pcsite.Computer.Gpu

  @doc """
  Returns the list of gpu.

  ## Examples

      iex> list_gpu()
      [%Gpu{}, ...]

  """
  def list_gpu do
    Repo.all(Gpu)
  end

  @doc """
  Gets a single gpu.

  Raises `Ecto.NoResultsError` if the Gpu does not exist.

  ## Examples

      iex> get_gpu!(123)
      %Gpu{}

      iex> get_gpu!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gpu!(id), do: Repo.get!(Gpu, id)

  @doc """
  Creates a gpu.

  ## Examples

      iex> create_gpu(%{field: value})
      {:ok, %Gpu{}}

      iex> create_gpu(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gpu(attrs \\ %{}) do
    %Gpu{}
    |> Gpu.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gpu.

  ## Examples

      iex> update_gpu(gpu, %{field: new_value})
      {:ok, %Gpu{}}

      iex> update_gpu(gpu, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gpu(%Gpu{} = gpu, attrs) do
    gpu
    |> Gpu.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gpu.

  ## Examples

      iex> delete_gpu(gpu)
      {:ok, %Gpu{}}

      iex> delete_gpu(gpu)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gpu(%Gpu{} = gpu) do
    Repo.delete(gpu)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gpu changes.

  ## Examples

      iex> change_gpu(gpu)
      %Ecto.Changeset{data: %Gpu{}}

  """
  def change_gpu(%Gpu{} = gpu, attrs \\ %{}) do
    Gpu.changeset(gpu, attrs)
  end
end

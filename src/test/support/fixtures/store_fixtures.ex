defmodule Pcsite.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pcsite.Store` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        ": "some \""
      })
      |> Pcsite.Store.create_book()

    book
  end
end

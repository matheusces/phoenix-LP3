defmodule Ex7ToDo.TodoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ex7ToDo.Todo` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Ex7ToDo.Todo.create_card()

    card
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        status: true,
        titulo: "some titulo"
      })
      |> Ex7ToDo.Todo.create_task()

    task
  end
end

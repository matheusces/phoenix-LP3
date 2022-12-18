defmodule Ex7ToDo.TodoTest do
  use Ex7ToDo.DataCase

  alias Ex7ToDo.Todo

  describe "cards" do
    alias Ex7ToDo.Todo.Card

    import Ex7ToDo.TodoFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Todo.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Todo.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Card{} = card} = Todo.create_card(valid_attrs)
      assert card.description == "some description"
      assert card.name == "some name"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todo.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Card{} = card} = Todo.update_card(card, update_attrs)
      assert card.description == "some updated description"
      assert card.name == "some updated name"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Todo.update_card(card, @invalid_attrs)
      assert card == Todo.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Todo.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Todo.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Todo.change_card(card)
    end
  end

  describe "tasks" do
    alias Ex7ToDo.Todo.Task

    import Ex7ToDo.TodoFixtures

    @invalid_attrs %{descricao: nil, status: nil, titulo: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Todo.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Todo.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{descricao: "some descricao", status: true, titulo: "some titulo"}

      assert {:ok, %Task{} = task} = Todo.create_task(valid_attrs)
      assert task.descricao == "some descricao"
      assert task.status == true
      assert task.titulo == "some titulo"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todo.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{descricao: "some updated descricao", status: false, titulo: "some updated titulo"}

      assert {:ok, %Task{} = task} = Todo.update_task(task, update_attrs)
      assert task.descricao == "some updated descricao"
      assert task.status == false
      assert task.titulo == "some updated titulo"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Todo.update_task(task, @invalid_attrs)
      assert task == Todo.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Todo.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todo.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Todo.change_task(task)
    end
  end
end

defmodule Ex7ToDo.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :descricao, :string
    field :status, :boolean, default: false
    field :titulo, :string
    field :card_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:titulo, :descricao, :status, :card_id])
    |> validate_required([:titulo, :descricao, :status, :card_id])
  end
end

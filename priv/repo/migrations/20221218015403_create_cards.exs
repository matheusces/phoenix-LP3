defmodule Ex7ToDo.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end

defmodule Ex7ToDo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :titulo, :string
      add :descricao, :string
      add :status, :boolean, default: false, null: false
      add :card_id, references(:cards, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:card_id])
  end
end

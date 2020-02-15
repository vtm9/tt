defmodule Tt.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps()
    end

    create index(:companies, [:customer_id])
  end
end

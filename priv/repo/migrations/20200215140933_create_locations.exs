defmodule Tt.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :invoice_amount, :integer
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create index(:locations, [:company_id])
  end
end

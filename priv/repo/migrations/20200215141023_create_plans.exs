defmodule Tt.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :location_ids, {:array, :integer}
      add :resource_type, :string
      add :resourcer_id, :integer
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps()
    end

    create index(:plans, [:customer_id])
  end
end

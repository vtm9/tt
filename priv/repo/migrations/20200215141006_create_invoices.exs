defmodule Tt.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :amount, :integer
      add :resource_id, :integer
      add :resource_type, :string
      add :locations_ids, {:array, :integer}

      timestamps()
    end
  end
end

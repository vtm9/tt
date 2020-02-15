defmodule Tt.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :amount, :integer
    field :locations_ids, {:array, :integer}
    field :resource_id, :integer
    field :resource_type, :string

    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:amount, :resource_id, :resource_type, :locations_ids])
    |> validate_required([:amount, :resource_id, :resource_type, :locations_ids])
  end
end

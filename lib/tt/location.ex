defmodule Tt.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locatinos" do
    field :invoice_amount, :integer
    field :name, :string
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :invoice_amount])
    |> validate_required([:name, :invoice_amount])
  end
end

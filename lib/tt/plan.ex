defmodule Tt.Plan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plans" do
    field :location_ids, {:array, :integer}
    field :resource_type, :string
    field :resourcer_id, :integer
    field :customer_id, :id

    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:location_ids, :resource_type, :resourcer_id])
    |> validate_required([:location_ids, :resource_type, :resourcer_id])
  end
end

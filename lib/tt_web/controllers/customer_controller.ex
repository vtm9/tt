defmodule TtWeb.CustomerController do
  use TtWeb, :controller

  alias Tt.Bill
  alias Tt.Bill.Customer

  def index(conn, _params) do
    customers = Bill.list_customers()
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Bill.change_customer(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Bill.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Bill.get_customer!(id)
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Bill.get_customer!(id)
    changeset = Bill.change_customer(customer)
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Bill.get_customer!(id)

    case Bill.update_customer(customer, customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Bill.get_customer!(id)
    {:ok, _customer} = Bill.delete_customer(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: Routes.customer_path(conn, :index))
  end
end

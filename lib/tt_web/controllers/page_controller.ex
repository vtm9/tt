defmodule TtWeb.PageController do
  use TtWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

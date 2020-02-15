defmodule TtWeb.Router do
  use TtWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", TtWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/customers", CustomerController
  end
end

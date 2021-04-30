defmodule PhoenixapiWeb.SuppliesController do
  use PhoenixapiWeb, :controller
  alias Phoenixapi
  alias Phoenixapi.Supply
  alias PhoenixapiWeb.FallbackController

  # Each unhandled exception will be send to FallbackController
  action_fallback FallbackController

  def create(conn, params) do
    # we can use with to:
    # do pattern match anytimes
    # use dinamic else
    # --- return a error for who called (Fallback) ---
    with {:ok, %Supply{} = supply} <- Phoenixapi.create_supply(params) do
      conn
      |> put_status(:ok)
      # render a view with the same name
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Phoenixapi.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end

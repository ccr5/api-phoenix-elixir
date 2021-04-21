defmodule PhoenixapiWeb.RestaurantsController do
  use PhoenixapiWeb, :controller
  alias Phoenixapi
  alias Phoenixapi.Restaurant
  alias PhoenixapiWeb.FallbackController

  # Each unhandled exception will be send to FallbackController
  action_fallback FallbackController

  def create(conn, params) do
    # we can use with to:
    # do pattern match anytimes
    # use dinamic else
    # --- return a error for who called (Fallback) ---
    with {:ok, %Restaurant{} = restaurant} <- Phoenixapi.create_restaurant(params) do
      conn
      |> put_status(:ok)
      # render a view with the same name
      |> render("create.json", restaurant: restaurant)
    end
  end
end

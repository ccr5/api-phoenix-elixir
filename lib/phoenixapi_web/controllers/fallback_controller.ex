defmodule PhoenixapiWeb.FallbackController do
  use PhoenixapiWeb, :controller
  alias PhoenixapiWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    # set which view will be render
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end

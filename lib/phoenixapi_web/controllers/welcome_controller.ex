defmodule PhoenixapiWeb.WelcomeController do
  use PhoenixapiWeb, :controller
  # alias directive is like import. Do a reference into this module context.
  alias Phoenixapi.Welcomer

  # this function is called int router.ex at line 12 :index
  def index(conn, params) do
    params |> Welcomer.welcome() |> handle_response(conn)
  end

  # using what we did in the class1, if :ok was matched, so we'll exec this private function defp
  defp handle_response({:ok, message}, conn) do
    render_response(conn, message, :ok)
  end

  defp handle_response({:error, message}, conn) do
    render_response(conn, message, :bad_request)
  end

  defp render_response(conn, message, status) do
    conn |> put_status(status) |> json(%{message: message})
  end
end

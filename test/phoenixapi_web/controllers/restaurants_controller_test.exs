defmodule PhoenixapiWeb.RestaurantsControllerTest do
  # Module to ConnCase tests (HTTP)
  use PhoenixapiWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates an user", %{conn: conn} do
      params = %{name: "Matheus", email: "test@live.com"}

      result =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:ok)

      assert %{
               "message" => "restaurant was created",
               "restaurant" => %{
                 "email" => "test@live.com",
                 "name" => "Matheus",
                 "id" => _id
               }
             } = result
    end

    test "when are invalid params, receive an error", %{conn: conn} do
      params = %{email: "test@live.com"}
      expected_value = %{"message" => %{"name" => ["can't be blank"]}}

      result =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert expected_value = result
    end
  end
end

defmodule PhoenixapiWeb.RestaurantsViewTest do
  use PhoenixapiWeb.ConnCase, async: true
  import Phoenix.View
  alias Phoenixapi.Restaurant
  alias PhoenixapiWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Matheus", email: "test@live.com"}
      {:ok, restaurant} = Phoenixapi.create_restaurant(params)
      result = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "restaurant was created",
               restaurant: %Restaurant{
                 email: "test@live.com",
                 id: _id,
                 name: "Matheus"
               }
             } = result
    end
  end
end

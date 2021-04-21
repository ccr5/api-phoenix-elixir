defmodule PhoenixapiWeb.RestaurantsView do
  use PhoenixapiWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "restaurant was created",
      restaurant: restaurant
    }
  end
end

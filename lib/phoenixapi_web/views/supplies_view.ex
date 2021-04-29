defmodule PhoenixapiWeb.SuppliesView do
  use PhoenixapiWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "supply was created",
      supply: supply
    }
  end

  def render("show.json", %{supply: supply}), do: %{supply: supply}
end

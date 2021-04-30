defmodule Phoenixapi do
  alias Phoenixapi.Restaurants.Create, as: RestaurantCreate
  alias Phoenixapi.Supplies.Create, as: SupplyCreate
  alias Phoenixapi.Supplies.Get, as: SupplyGet

  # this file is the module of my whole application, so to implement facade design pattern
  # we delegate a fucntio to here then my controllers just need to know this module
  # We can study more about facade design patterns and how it works
  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end

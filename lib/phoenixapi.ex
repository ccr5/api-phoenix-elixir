defmodule Phoenixapi do
  alias Phoenixapi.Restaurants.Create
  # this file is the module of my whole application, so to implement facade design pattern
  # we delegate a fucntio to here then my controllers just need to know this module
  # We can study more about facade design patterns and how it works
  defdelegate create_restaurant(params), to: Create, as: :call
end

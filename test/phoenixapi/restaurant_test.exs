defmodule Phoenixapi.RestaurantTest do
  # Test when we functions with DB and Changeset (DataCase)
  use Phoenixapi.DataCase, async: true
  alias Ecto.Changeset
  alias Phoenixapi.Restaurant

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "Matheus", email: "test@live.com"}
      result = Restaurant.changeset(params)
      # Test using pattern matching
      assert %Changeset{
               changes: %{
                 email: "test@live.com",
                 name: "Matheus"
               },
               valid?: true
             } = result
    end

    test "When an invalid params, returns a invalid changeset" do
      params = %{name: "M", email: ""}

      expected_value = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      result = Restaurant.changeset(params)
      assert %Changeset{valid?: false} = result
      assert errors_on(result) == expected_value
    end
  end
end

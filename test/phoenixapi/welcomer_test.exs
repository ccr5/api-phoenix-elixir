defmodule Phoenixapi.WelcomerTest do
  # lib to UnitCase tests
  use ExUnit.Case, async: true
  alias Phoenixapi.Welcomer

  # Its like a test in JS
  # Only public functions will be test
  describe "welcome/1" do
    test "When the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_value = {:ok, "Banana!"}
      result = Welcomer.welcome(params)
      assert result == expected_value
    end

    test "When the user is not special, returns a message" do
      params = %{"name" => "rafael", "age" => "25"}
      expected_value = {:ok, "Welcome rafael"}
      result = Welcomer.welcome(params)
      assert result == expected_value
    end

    test "When the user is under age, returns an error" do
      params = %{"name" => "rafael", "age" => "15"}
      expected_value = {:error, "You shall not pass rafael"}
      result = Welcomer.welcome(params)
      assert result == expected_value
    end
  end
end

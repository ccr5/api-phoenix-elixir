# --- Dictionary / Map --
# {} = %{}
# we can use
#   test = %{"name" => "matheus} | test["name]
#   test = %{name: matheus} | test.name

# --- Pipe Operation ---
# |> : pass a return value to other function

# --- Pattern Matching --
# You can see at line 16 that the last function is evaluate().
# There's 3 functions with the same name in Welcomer module and
# Depending on the params, it will call one of them

defmodule Phoenixapi.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)
    name |> String.trim() |> String.downcase() |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "Banana!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end

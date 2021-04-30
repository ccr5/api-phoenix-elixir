defmodule Phoenixapi.Supplies.GetByExpiration do
  import Ecto.Query
  alias Phoenixapi.{Repo, Restaurant, Supply}

  def call do
    today = Date.utc_today()
    begin = Date.beginning_of_week(today)
    finish = Date.end_of_week(today)

    # ^ = pin operator
    # Define a variable as imutable
    # Ex: x = 5 / now x is 5
    #     x = 2 / now x is 2
    # -------------------------------
    #     x = 5 / now x is 5
    #     ^x = 2 / MatchError because x is 5
    query =
      from supply in Supply,
        where: supply.expiration_date >= ^begin and supply.expiration_date <= ^finish,
        # preload includes values of a relationship
        preload: [:restaurant]

    # Enum module
    # fucntions to works with enumerables
    # lambda functions = fn
    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end

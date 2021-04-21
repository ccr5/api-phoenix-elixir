# set Ecto to use Postgres
# Repo module function is run commands in database (repository)
defmodule Phoenixapi.Repo do
  use Ecto.Repo,
    otp_app: :phoenixapi,
    adapter: Ecto.Adapters.Postgres
end

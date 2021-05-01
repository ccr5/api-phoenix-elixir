defmodule Phoenixapi.Supplies.ExpirationNotification do
  alias Phoenixapi.Mailer
  alias Phoenixapi.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    # ! =  return an exception
    |> Mailer.deliver_later!()
  end
end

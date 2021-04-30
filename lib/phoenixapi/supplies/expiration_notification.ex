defmodule Phoenixapi.Supplies.ExpirationNotification do
  alias Phoenixapi.Mailer
  alias Phoenixapi.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      # ! =  return an exception
      |> Mailer.deliver_later!()
    end)
  end
end

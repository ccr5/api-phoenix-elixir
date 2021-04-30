defmodule Phoenixapi.Supplies.ExpirationEmail do
  # lib to work with emails
  import Bamboo.Email

  alias Phoenixapi.Supply

  def create(to_email, supplies) do
    # function to create a email
    new_email(
      to: to_email,
      from: "app@phoenix.com.br",
      subject: "Supplies that are about to expire",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "---- Supplies that are about to expire ----\n"
    # <> = concat strings
    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible}\n"
  end
end

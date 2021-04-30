defmodule PhoenixapiWeb.ErrorView do
  use PhoenixapiWeb, :view
  alias Ecto.Changeset

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  # this function is called at fallback controller
  def render("error.json", %{result: %Changeset{} = changeset}) do
    %{message: translate_errors(changeset)}
  end

  # this function is called at fallback controller (when receive a string)
  def render("error.json", %{result: result}) do
    %{message: result}
  end

  # this function improves errors. We can see more in phoenix traverser erros (I think kk)
  defp translate_errors(changeset) do
    Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%(#{key}", to_string(value))
      end)
    end)
  end
end

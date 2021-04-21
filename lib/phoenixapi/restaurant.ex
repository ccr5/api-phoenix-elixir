defmodule Phoenixapi.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  # @.... create a module variable
  @required_params [:email, :name]

  # special variable of Jason module
  # pass which fields Jason will render
  # ++ = concat
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  # creating restaurants
  # Elixir / Phoenix doesn't use model but schema.
  # Schemas do cast and model datas.
  schema "restaurants" do
    field :email, :string
    field :name, :string
    timestamps()
  end

  # cast and validate data based on the schema
  def changeset(params) do
    # Reference to this module (Ex: Phoenixapi.Restaurant)
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end

defmodule Phoenixapi.Supply do
  use Ecto.Schema
  import Ecto.Changeset
  alias Phoenixapi.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # @.... create a module variable
  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  # special variable of Jason module
  # pass which fields Jason will render
  # ++ = concat
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  # creating restaurants
  # Elixir / Phoenix doesn't use model but schema.
  # Schemas do cast and model datas.
  schema "supplies" do
    field(:description, :string)
    field(:expiration_date, :date)
    field(:responsible, :string)

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  # cast and validate data based on the schema
  def changeset(params) do
    # Reference to this module (Ex: Phoenixapi.Restaurant)
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end
end

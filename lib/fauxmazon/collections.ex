defmodule Fauxmazon.Collections do

  use Ecto.Schema

  @derive {Jason.Encoder, only: [
    :id,
    :name,
    :description,
    :inserted_at,
    :updated_at]}
  schema "collections" do
    field :name, :string
    field :description, :string
    field :inserted_at, :utc_datetime
    field :updated_at, :utc_datetime
  end


end

defmodule Fauxmazon.Collections do

  use Ecto.Schema

  @derive {Jason.Encoder, only: [
    :id,
    :name,
    :description,
    :active,
    :created_at,
    :updated_at]}
  schema "collections" do
    field :name, :string
    field :description, :string
    field :active, :boolean
    field :created_at, :string
    field :updated_at, :string
  end


end

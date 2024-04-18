defmodule Fauxmazon.Products do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [
    :id,
    :name,
    :description,
    :price,
    :category,
    :brand,
    :stock,
    :image_url,
    :rating]}
  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :category, :string
    field :brand, :string
    field :stock, :integer
    field :image_url, :string
    field :rating, :decimal
  end
end

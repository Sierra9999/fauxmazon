defmodule Fauxmazon.Products do
  use Ecto.Schema
  import Ecto.Query
  alias Fauxmazon.{Products, Repo}
  @derive {Jason.Encoder, only: [
    :id,
    :name,
    :description,
    :price,
    :category,
    :brand,
    :stock,
    :image_url,
    :rating,
    :collection_id]}
  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :category, :string
    field :brand, :string
    field :stock, :integer
    field :image_url, :string
    field :rating, :decimal
    field :collection_id, :integer
    # inserted_at
    # updated_at
    # default fields expected by timestamps()
  end

  def all_products do
    Repo.all(Products)
  end

  def by_id(id) do
    Repo.get(Products, id)
  end

  def by_category(category) do
    query = from p in Products,
    where: p.category == ^category
    Repo.all(query)
  end
  def by_name(name) do
    query = from p in Products,
    where: ilike(p.name,^"%#{name}%")
    Repo.all(query)
  end


end

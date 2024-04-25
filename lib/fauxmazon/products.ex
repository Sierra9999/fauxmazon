defmodule Fauxmazon.Products do
  use Ecto.Schema
  import Ecto.Query
  alias Fauxmazon.{Products, Categories, ProductsCategories, Repo}

  @derive {Jason.Encoder,
           only: [
             :id,
             :name,
             :description,
             :price,
             :brand,
             :stock,
             :image_url,
             :rating
           ]}
  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :brand, :string
    field :stock, :integer
    field :image_url, :string
    field :rating, :decimal
    # inserted_at
    # updated_at
    # default fields expected by timestamps()
  end

  def all_products do
    Repo.all(Products)
  end

  def by_name(name) do
    query =
      from p in Products,
        where: ilike(p.name, ^"%#{name}%")

    Repo.all(query)
  end

  def by_id(id) do
    query = from c in Categories,
    join: pc in ProductsCategories,
    on: c.id == pc.category_id,
    where: pc.product_id == ^id ,
    select: c

    Repo.get(Products, id)
    |> Map.from_struct
    |> Map.delete(:__meta__)
    |> Map.merge(%{categories: Repo.all(query)})
  end

  def by_category(category) do
    products_query =
      from p in Products,
        join: pc in ProductsCategories,
        on: pc.product_id == p.id,
        join: c in Categories,
        on: pc.category_id == c.id,
        where: c.id == ^category,
        select: p

    category = from(c in Categories, where: c.id == ^category)

    category
    |> Repo.all
    |> List.first
    |> Map.from_struct
    |> Map.delete(:__meta__)
    |> Map.merge(%{products: Repo.all(products_query)})
  end
end

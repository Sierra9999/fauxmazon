defmodule Fauxmazon.Categories do

  use Ecto.Schema
  import Ecto.Query
  alias Fauxmazon.Categories
  alias Fauxmazon.{Products,ProductsCategories,Repo}

  @derive {Jason.Encoder, only: [
    :id,
    :name,
    :description,
    :inserted_at,
    :updated_at]}
  schema "categories" do
    field :name, :string
    field :description, :string
    field :inserted_at, :utc_datetime
    field :updated_at, :utc_datetime
  end
  def all_categories do
    Repo.all(Categories)
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

    category_query = from(c in Categories, where: c.id == ^category)

    category_query
    |> Repo.all
    |> List.first
    |> Map.from_struct
    |> Map.delete(:__meta__)
    |> Map.merge(%{products: Repo.all(products_query)})
  end
end

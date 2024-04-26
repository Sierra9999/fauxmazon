defmodule Fauxmazon.Products do
  use Ecto.Schema
  import Ecto.Query
  alias Fauxmazon.ProductImages
  alias Fauxmazon.{Products, Categories, ProductsCategories, Repo}

  @derive {Jason.Encoder,
           only: [
             :id,
             :name,
             :description,
             :price,
             :brand,
             :stock,
             :rating
           ]}
  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :brand, :string
    field :stock, :integer
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
    product = Repo.get(Products, id)
    if product == nil do
      raise RuntimeError
    else
      categories_query = from c in Categories,
      join: pc in ProductsCategories,
      on: c.id == pc.category_id,
      where: pc.product_id == ^id ,
      select: c

      images_query = from pi in ProductImages,
      where: pi.product_id == ^id,
      select: pi
      image_list = images_query
      |> Repo.all
      |> Enum.map(fn item-> Map.get(item,:url)  end)

      Repo.get(Products, id)
      |> Map.from_struct
      |> Map.delete(:__meta__)
      |> Map.merge(%{images: image_list ,categories: Repo.all(categories_query)})
    end
  end


end

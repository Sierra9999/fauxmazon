defmodule FauxmazonWeb.ProductsController do
  use FauxmazonWeb, :controller
  alias Fauxmazon.{Products, Repo}
  import Ecto.Query
  def index(conn, _params) do
    products = Repo.all(Products)
    json(conn, products)
  end
  def show_by_collection(conn, %{"collection_id" => collection_id}) do
    query = from p in Products,\
     where: p.collection_id == ^collection_id
    products = Repo.all(query)
    if Enum.empty?(products) do
      conn
      |> put_status(404)
      |> json(%{"error" => "No products found in the collection or the collection is empty"})
    else
      conn
      |> json(products)
    end
  end
  def show(conn, %{"id" => id}) do
    product = Repo.get(Products, id)
    json(conn, product)
  end

  def show_by_category(conn, %{"category" => category}) do
    capitalized_category = String.capitalize category
    query = from p in Products,
     where: p.category == ^capitalized_category
    products = Repo.all(query)
    json(conn, products)
  end

  def show_by_name(conn, params) do
    name = Map.get(params, "name", "")
    query = from p in Products,
    where: ilike(p.name,^"%#{name}%")
    product = Repo.all(query)
    json(conn, product)
  end
end

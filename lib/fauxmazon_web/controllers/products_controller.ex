defmodule FauxmazonWeb.ProductsController do
  alias Fauxmazon.Products
  use FauxmazonWeb, :controller
  import Products
  import Ecto.Query
  alias Fauxmazon.{Products, Repo}

  def index(conn, _params) do
    json(conn, all_products())
  end
  def show_by_id(conn, %{"id" => id}) do
    json(conn, by_id(id))
  end

  def show_by_name(conn, params) do
    name = Map.get(params, "name", "")
    json(conn, by_name(name))
  end

  def show_by_collection(conn, %{"collection_id" => collection_id}) do
    query = from p in Products,
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

  def show_by_category(conn, %{"category" => category}) do
    capitalized_category = String.capitalize category
    json(conn, by_category(capitalized_category))
  end


end

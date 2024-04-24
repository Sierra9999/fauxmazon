defmodule FauxmazonWeb.ProductsController do
  alias Fauxmazon.Products
  use FauxmazonWeb, :controller
  import Products

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

  def show_by_category(conn, %{"category" => category}) do
    json(conn, by_category(category))
  end


end

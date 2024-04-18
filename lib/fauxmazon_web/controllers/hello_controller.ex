defmodule FauxmazonWeb.HelloController do
  use FauxmazonWeb, :controller
  alias Fauxmazon.{Products, Repo}
  import Ecto.Query
  def index(conn, _params) do
    products = Repo.all(Products)
    json(conn, products)
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
end

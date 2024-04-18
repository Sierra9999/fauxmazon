defmodule FauxmazonWeb.HelloController do
  use FauxmazonWeb, :controller
  alias Fauxmazon.{Products, Repo}
  def index(conn, _params) do
    products = Repo.all(Products)
    json(conn, products)
  end
end

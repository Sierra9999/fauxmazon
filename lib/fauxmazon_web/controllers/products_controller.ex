defmodule FauxmazonWeb.ProductsController do
  alias Fauxmazon.Products
  use FauxmazonWeb, :controller
  import Products

  def index(conn, _params) do
    json(conn, all_products())
  end

  def show_by_id(conn, %{"id" => id}) do
    try do
      json(conn, by_id(String.to_integer(id)))
    rescue
      ArgumentError ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: "argument should be numeric"})
      RuntimeError ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "product not found"})
    end
  end

  def show_by_name(conn, params) do
    name = Map.get(params, "name", "")
    json(conn, by_name(name))
  end
end

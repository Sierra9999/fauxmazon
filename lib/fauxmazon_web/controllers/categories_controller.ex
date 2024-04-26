defmodule FauxmazonWeb.CategoriesController do
  alias Fauxmazon.Categories
  import Categories
  use FauxmazonWeb, :controller

  def index(conn,_params) do
    json(conn, all_categories())
  end

  def show_by_category(conn, %{"category" => category}) do
    json(conn, by_category(category))
  end

end

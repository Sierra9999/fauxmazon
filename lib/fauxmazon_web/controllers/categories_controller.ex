defmodule FauxmazonWeb.CategoriesController do
  use FauxmazonWeb, :controller
  alias Fauxmazon.{Categories, Repo}
  def index(conn,_params) do
    collections = Repo.all(Categories)
    json(conn, collections)
  end
end

defmodule FauxmazonWeb.CollectionsController do
  use FauxmazonWeb, :controller
  alias Fauxmazon.{Collections, Repo}
  def index(conn,_params) do
    collections = Repo.all(Collections)
    json(conn, collections)
  end
end

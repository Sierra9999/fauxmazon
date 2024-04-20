defmodule FauxmazonWeb.CollectionsController do
  use FauxmazonWeb, :controller
  def index(conn,_params) do
    text(conn, "imagine a list of all the collections available")
  end
end

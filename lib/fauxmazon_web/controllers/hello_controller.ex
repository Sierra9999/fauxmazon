defmodule FauxmazonWeb.HelloController do
  use FauxmazonWeb, :controller

  def index(conn, _params) do
    json(conn, %{message: "Hi"})
  end
end

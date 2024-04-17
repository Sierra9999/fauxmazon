defmodule FauxmazonWeb.HelloController do
  use FauxmazonWeb, :controller

  def index(conn, _params) do
    fake_product = %{
      id: 1,
      name: "Example Product",
      description: "This is a placeholder description for the example product.",
      price: 19.99,
      category: "Electronics",
      brand: "Fauxmazon Basics",
      stock: 100,
      image_url: "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?q=80&w=2576&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      rating: 4.5,
      reviews: [
        %{author: "John Doe", body: "Great product!", rating: 5},
        %{author: "Jane Smith", body: "Could be better.", rating: 3}
      ]
    }

    json(conn, fake_product )
  end
end

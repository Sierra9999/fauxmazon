defmodule Fauxmazon.ProductsCategories do
  use Ecto.Schema
  @derive{Jason.Encoder, only: []}

  schema "product_category" do
    field :product_id , :integer
    field :category_id, :integer
    timestamps()
  end

end

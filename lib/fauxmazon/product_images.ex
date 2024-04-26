defmodule Fauxmazon.ProductImages do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [
    :id,
    :url,
    :product_id,
    :inserted_at,
    :updated_at
  ]}

  schema "product_images" do
    field :url, :string
    field :product_id, :integer
    timestamps()
  end

end

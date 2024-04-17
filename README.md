# Fauxmazon 🛒

Fauxmazon is a fake store API built with the Phoenix framework in Elixir. It provides a simple and scalable solution for managing products and serving them via a RESTful API. Please note that this project is currently in development.

## About Fauxmazon

Fauxmazon simulates the functionality of an e-commerce platform, allowing users to interact with a catalog of products via HTTP endpoints. It provides basic operations for retrieving product information, searching for products, and filtering products by category.

### Product Interface

Products in the Fauxmazon API have the following properties:

- **ID**: A unique identifier for the product.
- **Name**: The name or title of the product.
- **Description**: A brief description of the product.
- **Price**: The price of the product.
- **Category**: The category or type of the product.
- **Brand**: The brand or manufacturer of the product.
- **Stock**: The current stock or inventory of the product.
- **Image URL**: The URL of an image representing the product.
- **Rating**: The average rating of the product (if applicable).
- **Reviews**: Reviews or comments from customers (if applicable).

### Entry Points

The following entry points are available in the Fauxmazon API:

1. **Get Product by ID**: `GET /products/:id`
2. **Get All Products**: `GET /products`
3. **Get Products by Category**: `GET /products?category=<category>`
4. **Search Products**: `GET /products?q=<query>`

These entry points allow users to retrieve product information, search for products, and filter products by category. Additional functionality may be added in future updates.

## Getting Started

To get started with Fauxmazon, follow these steps:

1. Clone the repository: `git clone https://github.com/Sierra9999/fauxmazon.git`
2. Install dependencies: `mix deps.get`
3. Start the Phoenix server: `mix phx.server`

## Contributing

Contributions are welcome! If you'd like to contribute to Fauxmazon, please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

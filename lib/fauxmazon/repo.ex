defmodule Fauxmazon.Repo do
  use Ecto.Repo,
    otp_app: :fauxmazon,
    adapter: Ecto.Adapters.Postgres
end

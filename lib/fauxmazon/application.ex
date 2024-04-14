defmodule Fauxmazon.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FauxmazonWeb.Telemetry,
      Fauxmazon.Repo,
      {DNSCluster, query: Application.get_env(:fauxmazon, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Fauxmazon.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Fauxmazon.Finch},
      # Start a worker by calling: Fauxmazon.Worker.start_link(arg)
      # {Fauxmazon.Worker, arg},
      # Start to serve requests, typically the last entry
      FauxmazonWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fauxmazon.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FauxmazonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

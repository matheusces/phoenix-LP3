defmodule Ex7ToDo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Ex7ToDo.Repo,
      # Start the Telemetry supervisor
      Ex7ToDoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ex7ToDo.PubSub},
      # Start the Endpoint (http/https)
      Ex7ToDoWeb.Endpoint
      # Start a worker by calling: Ex7ToDo.Worker.start_link(arg)
      # {Ex7ToDo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ex7ToDo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Ex7ToDoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

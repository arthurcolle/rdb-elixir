defmodule PhoenixExrethinkdbChat do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(PhoenixExrethinkdbChat.Endpoint, []),
      # Here you could define other workers and supervisors as children
      # worker(PhoenixExrethinkdbChat.Worker, [arg1, arg2, arg3]),
      worker(PhoenixExrethinkdbChat.Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixExrethinkdbChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixExrethinkdbChat.Endpoint.config_change(changed, removed)
    :ok
  end
end

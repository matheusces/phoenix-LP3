defmodule Ex7ToDo.Repo do
  use Ecto.Repo,
    otp_app: :ex7_to_do,
    adapter: Ecto.Adapters.Postgres
end

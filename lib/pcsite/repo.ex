defmodule Pcsite.Repo do
  use Ecto.Repo,
    otp_app: :pcsite,
    adapter: Ecto.Adapters.Postgres
end

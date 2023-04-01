defmodule FluffOrScruff.Repo do
  use Ecto.Repo,
    otp_app: :fluff_or_scruff,
    adapter: Ecto.Adapters.Postgres
end

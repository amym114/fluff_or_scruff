defmodule FluffOrScruffWeb.VoteLive.Index do
  use FluffOrScruffWeb, :live_view
  import FluffOrScruffWeb.PupInfo

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end

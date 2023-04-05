defmodule FluffOrScruffWeb.PageController do
  use FluffOrScruffWeb, :controller

  def home(conn, _params) do
    pups = [
      "fluff1.png",
      "scruff1.png",
      "Scruff2.png",
      "Fluff2.png",
      "fluff3.png",
      "scruff3.png",
      "scruff4.png",
      "fluff4.png"
    ]

    render(conn, :home, pups: pups)
  end

  def about(conn, _params) do
    render(conn, :about)
  end
end

defmodule FluffOrScruffWeb.PageController do
  use FluffOrScruffWeb, :controller

  def home(conn, _params) do
    pups = ["fluff1.png", "fluff2.png"]
    render(conn, :home, pups: pups)
  end

  def about(conn, _params) do
    render(conn, :about)
  end
end

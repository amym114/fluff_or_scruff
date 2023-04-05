defmodule FluffOrScruffWeb.PageHTML do
  use FluffOrScruffWeb, :html

  embed_templates "page_html/*"

  # defp pup_list(assigns) do
  #   Enum.map(assigns, fn pup ->
  #     ~H"""
  #     <img src={"/images/#{pup}"} />
  #     """
  #   end)
  # end
end

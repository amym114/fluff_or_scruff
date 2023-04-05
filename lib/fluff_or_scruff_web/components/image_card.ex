defmodule FluffOrScruffWeb.ImageCard do
  @moduledoc """
  Provides image card component.
  """
  use Phoenix.Component

  slot(:inner_block, required: true)

  def image_card(assigns) do
    ~H"""
    <div class="p-3 bg-white">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end

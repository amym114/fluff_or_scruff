defmodule FluffOrScruffWeb.ImageCard do
  @moduledoc """
  Provides image card component.
  """
  use Phoenix.Component

  attr :img, :string, required: true

  def image_card(assigns) do
    ~H"""
    <div class="p-3 bg-white">
      <img src={"images/#{@img}"} />
    </div>
    """
  end
end

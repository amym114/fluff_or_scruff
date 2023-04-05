defmodule FluffOrScruffWeb.PupInfo do
  @moduledoc """
  Provides pup info details component.
  """
  use Phoenix.Component
  import FluffOrScruffWeb.Typography

  attr :name, :string, default: ""
  attr :info, :string, default: ""

  def pup_info(assigns) do
    ~H"""
    <.t :if={@name != ""} variant="h2"><%= @name %></.t>
    <.t :if={@info != ""} variant="p" color="secondary" size="2xl"><%= @info %></.t>
    """
  end
end

defmodule FluffOrScruffWeb.ComponentHelpers do
  @moduledoc """
  Provides helpers for component building.
  """

  @doc """
  Builds and normalizes list of classes.
  ## Examples
      iex> assign_class(assigns, [" class1", "class2 ", ...])
      %{class: "class1 class2 ...", ..}
  """

  import Phoenix.Component

  def assign_class(assigns, []), do: assigns

  def assign_class(assigns, class_list) do
    assign_new(assigns, :class, fn ->
      if extend_class = Map.get(assigns, :extend_class) do
        [extend_class | Enum.reverse(class_list)]
        |> Enum.reverse()
        |> Enum.join(" ")
        |> String.trim()
      else
        class_list |> Enum.join(" ") |> String.trim()
      end
    end)
  end
end

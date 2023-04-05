defmodule FluffOrScruffWeb.Typography do
  @moduledoc """
  Provides typography component.
  """
  use Phoenix.Component

  attr :class, :string, default: nil
  attr(:color, :string, values: ["primary", "secondary", "tertiary"])
  attr(:element, :string)
  attr(:font, :string, values: ["display", "sans"])
  attr(:margin, :boolean, default: true)
  attr(:size, :string, values: ["xs", "sm", "md", "lg", "xl", "2xl", "3xl", "4xl", "5xl"])
  attr(:variant, :string, default: "p", values: ["h1", "h2", "p", "span"])

  attr(:weight, :string,
    values: [
      "thin",
      "normal",
      "bold"
    ]
  )

  attr(:rest, :global)

  slot(:inner_block, required: true)

  def t(assigns) do
    ~H"""
    <.dynamic_tag
      class={[
        classes(:color, assigns),
        classes(:font, assigns),
        classes(:margin, assigns),
        classes(:size, assigns),
        classes(:variant, assigns),
        classes(:weight, assigns),
        @class
      ]}
      name={@variant}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </.dynamic_tag>
    """
  end

  # Color
  defp classes(:color, %{color: "inherit"}), do: nil
  defp classes(:color, %{color: "primary", variant: "p"}), do: "text-primary"
  defp classes(:color, %{color: "secondary"}), do: "text-secondary"
  defp classes(:color, %{color: "tertiary"}), do: "text-tertiary"

  defp classes(:color, %{variant: "h1"}), do: "text-primary"
  defp classes(:color, %{variant: "h2"}), do: "text-secondary"

  # Font
  defp classes(:font, %{font: "display"}), do: "font-display"
  defp classes(:font, %{font: "sans"}), do: "font-sans"

  defp classes(:font, %{variant: "h1"}), do: "font-display"
  defp classes(:font, %{variant: "h2"}), do: "font-sans"
  defp classes(:font, %{variant: "p"}), do: "font-sans"

  # Margin
  defp classes(:margin, %{margin: false}), do: nil
  defp classes(:margin, %{variant: "h1"}), do: "mt-0 mb-3.5"
  defp classes(:margin, %{variant: "h2"}), do: "mt-8 mb-2"
  defp classes(:margin, %{variant: "p"}), do: "mb-5"

  # Size
  defp classes(:size, %{size: "xs"}), do: "text-xs"
  defp classes(:size, %{size: "sm"}), do: "text-sm"
  defp classes(:size, %{size: "md"}), do: "text-base"
  defp classes(:size, %{size: "lg"}), do: "text-lg"
  defp classes(:size, %{size: "xl"}), do: "text-xl"
  defp classes(:size, %{size: "2xl"}), do: "text-2xl"
  defp classes(:size, %{size: "3xl"}), do: "text-3xl"
  defp classes(:size, %{size: "4xl"}), do: "text-4xl"
  defp classes(:size, %{size: "5xl"}), do: "text-5xl"

  defp classes(:size, %{variant: "h1"}), do: "text-5xl"
  defp classes(:size, %{variant: "h2"}), do: "text-2xl"
  defp classes(:size, %{variant: "p"}), do: "text-base lg:text-lg"

  # Variant
  defp classes(:variant, %{variant: "h1"}), do: "leading-tight"
  defp classes(:variant, %{variant: "h2"}), do: "leading-tight"
  defp classes(:variant, %{variant: "p"}), do: "leading-7"

  # Weight
  defp classes(:weight, %{weight: "thin"}), do: "font-thin"
  defp classes(:weight, %{weight: "normal"}), do: "font-normal"
  defp classes(:weight, %{weight: "bold"}), do: "font-bold"

  defp classes(:weight, %{variant: "h1"}), do: "font-bold"
  defp classes(:weight, %{variant: "h2"}), do: "font-bold"
  defp classes(:weight, %{variant: "p"}), do: "font-normal"

  defp classes(_rule_group, _assigns), do: nil
end

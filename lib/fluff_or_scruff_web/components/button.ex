defmodule FluffOrScruffWeb.Button do
  @moduledoc """
  Provides button component.
  """
  use Phoenix.Component

  attr :type, :string, required: true
  attr :class, :string, default: nil

  attr(:color, :string,
    default: "primary",
    doc: "The color of the button.",
    values: ["primary", "secondary", "tertiary"]
  )

  attr(:font, :string,
    default: "display",
    doc: "The font of the button.",
    values: ["display", "sans"]
  )

  attr(:full_width, :boolean,
    doc: "If true, the component will take up the full width of its container."
  )

  attr(:size, :string,
    default: "lg",
    doc: "The size of the button.",
    values: ["sm", "lg"]
  )

  attr(:variant, :string,
    default: "contained",
    doc: "The variant to use on the button.",
    values: ["contained", "outlined", "text"]
  )

  attr(:rest, :global,
    doc: "Arbitrary HTML or phx attributes",
    include:
      ~w(csrf_token disabled download form href hreflang method name navigate patch referrerpolicy rel replace target type value)
  )

  slot(:inner_block, required: true)

  def fos_button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "phx-submit-loading:opacity-75 rounded-md",
        classes(:color, assigns),
        classes(:font, assigns),
        classes(:full_width, assigns),
        classes(:size, assigns),
        classes(:variant, assigns),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  defp classes(:font, %{font: "display"}), do: "font-display"
  defp classes(:font, %{font: "sans"}), do: "font-sans"

  # Color
  defp classes(:color, %{color: color, variant: "contained"}) do
    # What you can't do because of Tailwind JIT
    # "bg-#{color} border-#{color} text-white hover:bg-white hover:text-#{color} active:bg-#{color}/50"

    case color do
      "primary" ->
        "bg-primary text-white hover:bg-primary-light active:bg-primary/50"

      "secondary" ->
        "bg-secondary text-white hover:bg-secondary-light active:bg-secondary/50"

      "tertiary" ->
        "bg-tertiary text-white hover:bg-tertiary-light active:bg-tertiary/50"
    end
  end

  defp classes(:color, %{color: color, variant: "outlined"}) do
    case color do
      "primary" ->
        "border-primary bg-white text-primary active:bg-primary/50"

      "secondary" ->
        "border-secondary bg-white text-secondary active:bg-secondary/50"

      "tertiary" ->
        "border-tertiary bg-white text-tertiary hover:text-tertiary-light hover:border-tertiary-light active:bg-tertiary/50"
    end
  end

  defp classes(:color, %{color: color, variant: "text"}) do
    case color do
      "primary" ->
        "text-primary"

      "secondary" ->
        "text-secondary"

      "tertiary" ->
        "text-tertiary"
    end
  end

  # Full Width
  defp classes(:full_width, %{full_width: true}), do: "w-full"

  # Size
  defp classes(:size, %{size: "sm"}), do: "p-2 text-lg"
  defp classes(:size, %{size: "lg"}), do: "py-3 px-5 text-3xl font-bold"

  # Variant
  defp classes(:variant, %{variant: "contained"}), do: ""
  defp classes(:variant, %{variant: "outlined"}), do: "border border-solid"
  defp classes(:variant, %{variant: "text"}), do: "bg-transparent"

  defp classes(_rule_group, _assigns), do: nil
end

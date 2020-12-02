defmodule ResistorColor do
  @moduledoc false

  @color_list ["black","brown","red","orange","yellow","green","blue","violet","grey","white"]

  @spec colors() :: list(String.t())
  def colors do
    @color_list
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    colors
    |> Enum.find_index(fn x -> x == color end)
  end

end
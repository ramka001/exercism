defmodule Markdown do
  @doc """

    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @params %{1 => "_", 2 => "__",   3 => "#", 4 => "*", 5 => "\n"}

  @spec parse(String.t()) :: String.t()
  def parse(m) do
      m
      |> String.split(@params[5])
      |> Enum.map(&process(&1))
      |> Enum.join
      |> String.replace("<li>", "<ul><li>", global: false)
      |> String.replace_suffix("</li>","</li></ul>")
  end

  defp process(m) do
    cond do
      m |> String.starts_with?(@params[3]) -> m |> headers
      m |> String.starts_with?(@params[4]) -> m |> parse_list_md_level
      true -> "<p>#{m |> String.split |> set_prefix_suffix}</p>"
    end
  end

  defp headers(m) do
    input =  m
             |> String.split
             |> Enum.at(0)
             |> String.length

    "<h#{input}>#{m |> String.replace(@params[3], "") |> String.trim}</h#{input}>"
  end

  defp parse_list_md_level(m) do
    input =  m
             |> String.trim_leading(@params[4])
             |> String.split
             |> set_prefix_suffix

    "<li>#{input}</li>"
  end

  defp set_prefix_suffix(m) do
    m
    |> Enum.map(fn w -> w |> replace_prefix |> replace_suffix  end)
    |> Enum.join(" ")
  end

  defp replace_prefix(m) do
    cond do
      m |> String.starts_with?(@params[2]) -> m |> String.replace_prefix(@params[2],"<strong>")
      m |> String.starts_with?(@params[1]) -> m |> String.replace_prefix(@params[1],"<em>")
      true -> m
    end
  end

  defp replace_suffix(w) do
    cond do
      w |> String.ends_with?(@params[2]) -> w |> String.replace_suffix(@params[2],"</strong>")
      w |> String.ends_with?(@params[1]) -> w |> String.replace_suffix(@params[1],"</em>")
      true -> w
    end
  end

end
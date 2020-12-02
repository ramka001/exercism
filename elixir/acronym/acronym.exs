defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
      input1 = string
              |> String.replace(~r/[-]/, "")
              |> String.split()

      input2 = for i <- input1 do
        i |> String.split(~r/[A-Z][a-z]*/, include_captures: true)
      end

      input3 = input2 |> List.flatten()

      input4 = for i <- input3 do
        i
        |> String.trim()
        |> String.capitalize()
        |> String.split(~r/[^-A-Z]/)
      end

      input4 |> to_string()
  end

end
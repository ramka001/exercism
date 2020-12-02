defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[ ](?=[ ])|[^-A-Za-z0-9äöüÄÖÜß]+/u, trim: true)
    |> Enum.reduce(%{}, fn x, y -> Map.update(y, x, 1, &(&1 + 1)) end)
  end

end
defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    points = %{"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
               "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4,
               "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10, "" => 0, " \t\n" => 0}

    input = word |> String.upcase |> String.split("",trim: true)

    loop_output = for i <- input do points[i] end

    loop_output |> sum_numbers
  end

  defp sum_numbers([head | tail]) when is_number(head), do: sum_numbers(tail) + head

  defp sum_numbers([_head | tail]), do: sum_numbers(tail)

  defp sum_numbers([]), do: 0
end
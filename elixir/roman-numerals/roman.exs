defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  @roman %{
            1 => "I", 4 => "IV", 5 => "V", 9 => "IX",
            10 => "X", 40 => "XL", 50 => "L", 90 => "XC",
            100 => "C", 400 => "CD", 500 => "D",
            900 => "CM", 999 => "IM",  1000 => "M"
          }
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    number |> convert("")
  end

  defp convert(number, roman_accumulator) when number <= 3 do
    roman_accumulator <> String.duplicate(@roman[1], number)
  end

  defp convert(number, roman_accumulator) when number == 4 do
    roman_accumulator <> @roman[4]
  end

  defp convert(number, roman_accumulator) when number >= 5 and number < 9 do
    convert(number - 5, roman_accumulator <> @roman[5])
  end

  defp convert(number, roman_accumulator) when number == 9 do
    roman_accumulator <> @roman[9]
  end

  defp convert(number, roman_accumulator) when number >= 10 and number < 40 do
    convert(number - 10, roman_accumulator <> @roman[10])
  end

  defp convert(number, roman_accumulator) when number >= 40 and number < 50 do
    convert(number - 40, roman_accumulator <> @roman[40])
  end

  defp convert(number, roman_accumulator) when number >= 50 and number < 90 do
    convert(number - 50, roman_accumulator <> @roman[50])
  end

  defp convert(number, roman_accumulator) when number >= 90 and number < 100 do
    convert(number - 90, roman_accumulator <> @roman[90])
  end

  defp convert(number, roman_accumulator) when number >= 100 and number < 400 do
    convert(number - 100, roman_accumulator <> @roman[100])
  end

  defp convert(number, roman_accumulator) when number >= 400 and number < 500 do
    convert(number - 400, roman_accumulator <> @roman[400])
  end

  defp convert(number, roman_accumulator) when number >= 500 and number < 900 do
    convert(number - 500, roman_accumulator <> @roman[500])
  end

  defp convert(number, roman_accumulator) when number >= 900  and number < 1000 do
    convert(number - 900, roman_accumulator <> @roman[900])
  end

  defp convert(number, roman_accumulator) when number >= 1000 do
    convert(number - 1000, roman_accumulator <> @roman[1000])
  end

end
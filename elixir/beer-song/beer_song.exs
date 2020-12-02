defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
      cond do
        number == 0 -> common("no more")
        number == 1 -> "#{number} bottle of beer on the wall, #{number} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
        number == 2 -> "#{common(number)} bottle of beer on the wall.\n"
        number >=3 and number <=99 -> "#{common(number)} bottles of beer on the wall.\n"
      end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range\\ 99..0) do
    range
    |> Enum.map_join("\n",&verse/1)
  end

  defp common(number) do
    if(number |> is_number()) do
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number-1}"
    else
      "#{String.capitalize(number)} bottles of beer on the wall, #{number} bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

end
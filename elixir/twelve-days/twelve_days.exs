defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @days_map  %{
     1 => "first", 2 => "second", 3 => "third", 4 => "fourth",
     5 => "fifth", 6 => "sixth", 7 => "seventh", 8 => "eighth",
     9 => "ninth", 10 => "tenth", 11 => "eleventh", 12 => "twelfth"
  }

  @gifts_map  %{
      1 => "a Partridge in a Pear Tree.",   2 => "two Turtle Doves,\s",
      3 => "three French Hens,\s",          4 => "four Calling Birds,\s",
      5 => "five Gold Rings,\s",            6 => "six Geese-a-Laying,\s",
      7 => "seven Swans-a-Swimming,\s",     8 => "eight Maids-a-Milking,\s",
      9 => "nine Ladies Dancing,\s",       10 => "ten Lords-a-Leaping,\s",
      11 => "eleven Pipers Piping,\s",     12 => "twelve Drummers Drumming,\s"
  }

  @spec verse(number :: integer) :: String.t()
  def verse(number) do
      start() <> @days_map[number] <> mid() <> gifts(number)
  end

  defp gifts(1), do: @gifts_map[1]
  defp gifts(2), do: @gifts_map[2] <> join() <> gifts(1)
  defp gifts(number), do: @gifts_map[number] <> gifts(number - 1)

  defp start(), do: "On the\s"
  defp mid(), do: "\sday of Christmas my true love gave to me:\s"
  defp join(), do: "and\s"

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
     starting_verse..ending_verse
     |> Enum.map(&verse/1)
     |> Enum.join("\n")
   end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1,12)
  end

end
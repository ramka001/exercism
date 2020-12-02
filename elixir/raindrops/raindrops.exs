defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @sound %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
      [3,5,7]
      |> Enum.filter(&Integer.mod(number, &1) == 0)
      |> Enum.map(&Map.get(@sound, &1))
      |> Enum.join()
      |> (fn "" -> number |> Integer.to_string()
            str -> str
         end).()
  end

end

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    use Bitwise, only_operators: true
    (31 &&& code) |> process_validation
  end

  defp ones(0), do: []
  defp ones(1), do: ["wink"]
  defp tens(0), do: []
  defp tens(1), do: ["double blink"]
  defp hundreds(0), do: []
  defp hundreds(1), do: ["close your eyes"]
  defp thousands(0), do: []
  defp thousands(1), do: ["jump"]

  defp process([a]), do: a |> ones
  defp process([a,b]), do: (b |> ones) ++  (a |> tens)
  defp process([a,b,c]), do: (c |> ones) ++ (b |> tens) ++ (a|> hundreds)
  defp process([a,b,c,d]), do: (d |> ones) ++ (c |> tens) ++ (b  |> hundreds) ++ (a |> thousands)
  defp process([1,a,b,c,d]), do: (a |> thousands) ++ (b  |> hundreds) ++ (c |> tens) ++ (d |> ones)

  defp process_validation(code), do: code |> Integer.digits(2) |> process

end
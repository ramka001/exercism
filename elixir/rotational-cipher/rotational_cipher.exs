defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text |> to_charlist |> Enum.map(&check(&1,shift) ) |> to_string
  end

  defp check(text, shift) when text in ?a..?z, do: rem(text - ?a + shift, 26) + ?a

  defp check(text, shift) when text in ?A..?Z, do: rem(text - ?A + shift, 26) + ?A

  defp check(text,_), do: text

end




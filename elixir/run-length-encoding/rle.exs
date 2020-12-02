defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do

   output = string
            |> String.graphemes
            |> Enum.reduce(%{}, fn char, acc ->  Map.update(acc, char, 1, &(&1 + 1))  end)

    output
    |> Map.keys
    |> Enum.map(fn key  -> if(output[key] >= 1) do "#{output[key]}#{key}" else "#{key}"  end end)
    |> Enum.join("")

  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do

    input = string
            |> String.reverse
            |> String.split("",trim: true)

    input2 =  input
              |> Enum.chunk_every(2)
              |> Enum.map(fn [a, b] -> {a, b} end)
              |> Map.new

    input2
    |> Enum.map(fn {k,v} -> k |> String.duplicate(v |> String.to_integer) end)
    |> Enum.join("")

  end




end

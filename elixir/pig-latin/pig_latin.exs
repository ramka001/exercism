defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    if phrase |> String.contains?(" ") do
      words = for word <- phrase |> String.split, do:  word |>  update
      words |> Enum.join(" ")
    else
      phrase |> update
    end

  end

  defp update(phrase) do

    vowels =  ["a" , "e", "i", "o", "u"]
    consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    many_consonants = ["zkrr", "zzz"]
    groups_of_two = ["ch", "qu", "pl", "th"]
    groups_of_three = ["squ", "thr", "sch", "str"]
    x_consonants = for xes <- consonants, do: "x" <> xes
    y_consonants = for yes <- consonants, do: "y" <> yes

    first = phrase |> String.first
    last = phrase |> String.slice(1..-1)

    first_group_two = phrase |> String.slice(0..1)
    last_group_two = phrase |> String.slice(2..-1)

    first_group_three = phrase |> String.slice(0..2)
    last_group_three = phrase |> String.slice(3..-1)

    first_group_four = phrase |> String.slice(0..-4)
    last_group_four = phrase |> String.slice(-3..-1)

    cond do
      phrase |> starts_with?(groups_of_three) -> last_group_three <> first_group_three <> "ay"
      phrase |> starts_with?(groups_of_two) -> last_group_two <> first_group_two <> "ay"
      phrase |> contains?(many_consonants) -> last_group_four <> first_group_four <> "ay"
      phrase |> starts_with?(x_consonants) -> phrase <> "ay"
      phrase |> starts_with?(y_consonants) -> phrase <> "ay"
      phrase |> starts_with?(consonants) -> last <> first <> "ay"
      phrase |> starts_with?(vowels) -> phrase <> "ay"
    end
  end

  defp starts_with?(phrase, condition) do
    phrase |> String.downcase |> String.starts_with?(condition)
  end

  def contains?(phrase, condition) do
    phrase |> String.downcase |> String.contains?(condition)
  end


end


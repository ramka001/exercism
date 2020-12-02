defmodule Bob do

  def hey(input) do

    blank = [input |> blanks() == "" or  input |> blanks() == "  "] |> Enum.any?()
    askQuestion = [ input |> endsWithQuestionSymbol?() and input |> hasCapitalFirst?()] |> Enum.all?()
    yell = [ input|> hasUpperCase?() and not (input |> endsWithQuestionSymbol?()) and not (input |> endsWithNumber?()) ] |> Enum.all?()
    yellQuestion = [input |> hasUpperCase?() and input |> endsWithQuestionSymbol?() ] |> Enum.all?()
    other =  [input |> hasOption1?() or input |> hasOption2?() or input |> hasOption3?() or input |> hasOption4?() or input |> hasOption5?()] |> Enum.any?()

    cond do
      blank -> "Fine. Be that way!"
      askQuestion -> "Sure."
      yell -> "Whoa, chill out!"
      yellQuestion -> "Calm down, I know what I'm doing!"
      other -> "Whatever."
    end
  end

  defp blanks(input) do
    input |> String.trim()
  end

  defp hasExclamation?(input) do
    input |> String.contains?("!")
  end

  defp endsWithExclamation?(input) do
    input |> String.ends_with?("!")
  end

  defp hasQuestion?(input) do
    input |> String.contains?("?")
  end

  defp endsWithQuestionSymbol?(input) do
    input |> String.ends_with?("?")
  end

  defp hasCapitalFirst?(input) do
    capitalFirst = input |> String.capitalize()
    input |> String.contains?(capitalFirst)
  end

  defp hasUpperCase?(input) do
    upperCase = input |> String.upcase()
    input |> String.contains?(upperCase)
  end

  defp endsWithNumber?(input ) do
    input |> String.ends_with?("3")
  end

  defp hasOption1?(input) do
    input |> hasCapitalFirst?() and input |> endsWithExclamation?()
  end

  defp hasOption2?(input) do
    input |> endsWithExclamation?() and not (input |> hasUpperCase?())
  end

  defp hasOption3?(input) do
    input |> hasCapitalFirst?() and not ( input |> hasExclamation?())
  end

  defp hasOption4?(input) do
    input |> endsWithNumber?() and not (input |> hasExclamation?()) and not (input |> hasUpperCase?())
  end

  defp hasOption5?(input) do
    input |> hasCapitalFirst?() and input |> hasQuestion?()
  end

end

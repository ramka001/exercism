defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  defmacro nucleotides, do: unquote(@nucleotides)

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
      strand |> count_nucleotide(nucleotide)
  end

  defp count_nucleotide(strand, number) do
    strand |> to_string |> String.graphemes |> Enum.count(& &1 == << List.to_integer('#{number}') :: utf8 >>)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Map.new(@nucleotides, &{&1, count(strand, &1)})
  end

end

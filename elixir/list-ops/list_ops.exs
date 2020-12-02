defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    l |> list_count()
  end

  @spec reverse(list) :: list
  def reverse(l) do
    l |> list_reverse([])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    l |> list_map(f)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    l |> list_filter(f)
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
    l |> list_reduce(acc,f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
   a |> list_append(b)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ll |> list_concat()
  end



  defp list_count([]), do: 0

  defp list_count([_head|tail]), do: 1 + list_count(tail)


  defp list_reverse([],reversed), do: reversed

  defp list_reverse([head | tail], reversed), do: tail |> list_reverse([head | reversed])


  defp list_map([],_func), do: []

  defp list_map([head | tail], func), do: [func.(head) | list_map(tail,func)]


  defp list_filter([],_func), do: []

  defp list_filter([head | tail],func) do
    if func.(head) do
      [head | list_filter(tail,func)]
    else
      tail |> list_filter(func)
    end
  end

  defp list_reduce([], value, _), do: value

  defp list_reduce([head | tail], value, func), do: tail |> list_reduce(func.(head, value), func)


  defp list_append([head | tail], b), do: [head | list_append(tail,b)]

  defp list_append([],b), do: b


  defp list_concat(x), do: x |> list_concat([]) |>  list_reverse([])

  defp list_concat([],acc), do: acc

  defp list_concat([h | t], acc) when is_list(h), do: t |> list_concat(list_concat(h,acc))

  defp list_concat([h|t],acc), do: t |> list_concat([h|acc])

end

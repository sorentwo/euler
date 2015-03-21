defmodule EulerFortyTwo do
  @moduledoc """
  The nth term of the sequence of triangle numbers is given by, tn =
  ½n(n+1); so the first ten triangle numbers are:

  1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

  By converting each letter in a word to a number corresponding to its
  alphabetical position and adding these values we form a word value.
  For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If
  the word value is a triangle number then we shall call the word a
  triangle word.

  Using words.txt (right click and 'Save Link/Target As...'), a 16K
  text file containing nearly two-thousand common English words, how
  many are triangle words?
  """
  @alpha ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @fname "data/p042_words.txt"
  def solve do
    mapping   = makemap
    triangles = 1..26 |> Enum.map(&tn/1)

    File.open!(@fname, [:read])
    |> IO.read(:line)
    |> String.split(",")
    |> Enum.map(&String.strip/1)
    |> Enum.map(&(calc_tval(mapping, &1)))
    |> Enum.filter(&(is_triangle?(triangles, &1)))
    |> length
  end

  defp makemap do
    Enum.with_index(@alpha)
    |> Enum.map(fn({l, v}) -> {l, v + 1} end)
    |> Enum.reduce(%{}, fn({k, v}, m) -> Map.put(m, k, v) end)
  end

  defp calc_tval(mapping, word) do
    word
    |> String.graphemes
    |> Enum.map(&(tval(mapping, &1)))
    |> Enum.sum
  end

  defp tn(n), do: trunc((n / 2) * (n + 1))

  defp tval(_, "\""), do: 0
  defp tval(m, alph), do: Map.get(m, alph)

  defp is_triangle?(triangles, value), do: value in triangles
end

IO.puts EulerFortyTwo.solve

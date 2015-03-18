defmodule EulerForty do
  @moduledoc """
  An irrational decimal fraction is created by concatenating the positive integers:

  0.123456789101112131415161718192021...

  It can be seen that the 12th digit of the fractional part is 1.

  If dn represents the nth digit of the fractional part, find the value of the following expression.

  d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
  """
  def solve do
  end

  defp iteration do
    Stream.iterate(1, &(&1 + 1))
  end

  defp sequence(n) do
    Enum.reduce(1..n, '', fn(x, acc) -> acc ++ Integer.to_char_list(x) end)
  end

  defp value_at(list, n), do: list |> List.to_string |> String.at(n)
end

defmodule EulerForty do
  @moduledoc """
  An irrational decimal fraction is created by concatenating the positive integers:

  0.123456789101112131415161718192021...

  It can be seen that the 12th digit of the fractional part is 1.

  If dn represents the nth digit of the fractional part, find the value of the following expression.

  d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
  """
  def solve do
    # [10.0, 54.5, 369.3, 2776.7, 22221.1, 185184.1]
    Enum.map([10, 100, 1000, 10000, 100000, 1000000], &dn/1)

    Enum.reduce([1, 5, 3, 7, 2, 1], 1, &(&1 * &2))
  end

  defp dn(n) do
    nth_value(n)
  end

  defp nth_value(n), do: (n - 1) + (n - preceding(n)) / (int_length(n) - 1)
  defp preceding(n), do: Enum.reduce(1..(n-1), 0, fn(x, a) -> a + int_length(x) end)
  defp int_length(n), do: length(Integer.to_char_list(n))
end

IO.puts inspect(EulerForty.solve)

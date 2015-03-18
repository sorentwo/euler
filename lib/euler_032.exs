defmodule EulerThirtyTwo do
  @moduledoc """
  We shall say that an n-digit number is pandigital if it makes use of all the
  digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
  through 5 pandigital.

  The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
  multiplicand, multiplier, and product is 1 through 9 pandigital.

  Find the sum of all products whose multiplicand/multiplier/product identity can
  be written as a 1 through 9 pandigital.

  HINT: Some products can be obtained in more than one way so be sure to only
  include it once in your sum.
  """
  def solve do
    Enum.filter(tuples, &pandigital?/1)
      |> Enum.map(fn({_, _, c}) -> c end)
      |> Enum.uniq
      |> Enum.reduce(0, &(&1 + &2))
  end

  def tuples do
    a = lc m inlist :lists.seq(1, 9),   n inlist :lists.seq(1000, 9999), do: {m, n, m * n}
    b = lc m inlist :lists.seq(10, 99), n inlist :lists.seq(100, 999), do: {m, n, m * n}

    a ++ b
  end

  def pandigital?({a, b, c}) do
    digits = concat(concat(a, b), c) |> integer_to_binary |> String.graphemes |> Enum.sort

    Enum.join(digits) == "123456789"
  end

  def concat(a, b), do: concat(a, b, b)
  def concat(a, b, c) when c > 0, do: concat(a * 10, b, div(c, 10))
  def concat(a, b, _), do: a + b
end

t1 = :os.timestamp
answer = EulerThirtyTwo.solve
t2 = :os.timestamp

IO.inspect "#{answer} in #{:timer.now_diff(t2, t1) / 1000}"

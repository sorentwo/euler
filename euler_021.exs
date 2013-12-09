defmodule EulerTwentyOne do
  @moduledoc """
  Let d(n) be defined as the sum of proper divisors of n (numbers less than n
  which divide evenly into n).

  If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
  each of a and b are called amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
  and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
  142; so d(284) = 220.

  Evaluate the sum of all the amicable numbers under 10000.
  """
  def solve(n // 10_000) do
    Enum.map(1..n, &amicables/1)
      |> Enum.reject(&nil?/1)
      |> Enum.uniq
      |> Enum.reduce(0, fn({a, b}, acc) -> acc + a + b end)
  end

  def divisors(1), do: [1]
  def divisors(2), do: [1, 2]
  def divisors(n), do: Enum.filter(1..round(n / 2), &(rem(n, &1) == 0))

  def sum(list), do: Enum.reduce(list, 0, &(&1 + &2))

  def amicables(a) do
    b = sum(divisors(a))
    if sum(divisors(b)) == a, do: ordered(a, b), else: nil
  end

  def ordered(a, b) when a < b, do: {a, b}
  def ordered(a, b) when a > b, do: {b, a}
  def ordered(a, b) when a == b, do: nil
end

# IO.puts inspect(EulerTwentyOne.solve)

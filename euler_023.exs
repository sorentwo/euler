defmodule EulerTwentyThree do
  @moduledoc """
  A perfect number is a number for which the sum of its proper divisors is
  exactly equal to the number. For example, the sum of the proper divisors of 28
  would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

  A number n is called deficient if the sum of its proper divisors is less than n
  and it is called abundant if this sum exceeds n.

  As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
  number that can be written as the sum of two abundant numbers is 24. By
  mathematical analysis, it can be shown that all integers greater than 28123 can
  be written as the sum of two abundant numbers. However, this upper limit cannot
  be reduced any further by analysis even though it is known that the greatest
  number that cannot be expressed as the sum of two abundant numbers is less than
  this limit.

  Find the sum of all the positive integers which cannot be written as the sum of
  two abundant numbers.
  """
  def solve(limit // 28123) do
    abundants = Enum.take_while(abundant_numbers, &(&1 < limit))
    permuted  = permuted_sums(abundants)

    Enum.reject(1..limit, fn(n) -> Enum.member?(permuted, n) end) |> Calc.sum
  end

  def abundant_numbers do
    Stream.iterate(12, &(&1 + 1)) |> Stream.filter(&is_abundant?/1)
  end

  def permuted_sums(list) do
    lc x inlist list, y inlist list, do: x + y
  end

  def is_abundant?(n) do
    (divisors(n) |> Calc.sum) > n
  end

  def divisors(1), do: [1]
  def divisors(2), do: [1, 2]
  def divisors(3), do: [1, 3]
  def divisors(n), do: [1] ++ Enum.filter(2..round(n / 2), &(rem(n, &1) == 0))
end

IO.inspect EulerTwentyThree.solve

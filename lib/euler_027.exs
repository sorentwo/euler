defmodule EulerTwentySeven do
  @moduledoc """
  Euler discovered the remarkable quadratic formula:

  n² + n + 41

  It turns out that the formula will produce 40 primes for the consecutive
  values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is
  divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly
  divisible by 41.

  The incredible formula  n² − 79n + 1601 was discovered, which produces 80
  primes for the consecutive values n = 0 to 79. The product of the
  coefficients, −79 and 1601, is −126479.

  Considering quadratics of the form:

  n² + an + b, where |a| < 1000 and |b| < 1000

  where |n| is the modulus/absolute value of n
  e.g. |11| = 11 and |−4| = 4

  Find the product of the coefficients, a and b, for the quadratic expression
  that produces the maximum number of primes for consecutive values of n,
  starting with n = 0.
  """

  def solve(a_limit // 1000, b_limit // 1000) do
    ab_pairs = lc a inlist :lists.seq(-1000, a_limit), b inlist :lists.seq(-1000, b_limit), do: {a,b}

    Enum.max_by(ab_pairs, fn({a, b}) ->
      Stream.iterate(0, &(&1 + 1)) |> Enum.take_while(fn(n) -> prime?(quadratic(n, a, b)) end) |> length
    end)
  end

  def quadratic(n, a, b), do: (n * n) + (a * n) + b

  def prime?(x) when x in [1, 2, 3, 5, 7, 11, 13, 17], do: true
  def prime?(x) do
    Enum.all?((2..round(:math.sqrt(abs(x)))), fn(n) -> rem(x, n) != 0 end)
  end
end

IO.inspect EulerTwentySeven.solve

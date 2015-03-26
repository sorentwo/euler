defmodule EulerFortySeven do
  alias PrimeSieve

  @moduledoc """
  The first two consecutive numbers to have two distinct prime factors
  are:

  14 = 2 × 7
  15 = 3 × 5

  The first three consecutive numbers to have three distinct prime
  factors are:

  644 = 2² × 7 × 23
  645 = 3 × 5 × 43
  646 = 2 × 17 × 19.

  Find the first four consecutive integers to have four distinct prime
  factors. What is the first of these numbers?
  """
  def solve do
    consecutive(645, 4, PrimeSieve.primes(1000))
  end

  def consecutive(n, lim, primes), do: consecutive(n, lim, primes, 0)

  def consecutive(n, lim, _, run) when run == lim, do: n - lim
  def consecutive(n, lim, primes, run) do
    if length(prime_factors(n, primes)) == lim do
      consecutive(n + 1, lim, primes, run + 1)
    else
      consecutive(n + 1, lim, primes, 0)
    end
  end

  def prime_factors(n, primes) do
    prime_factors(n, smaller(n, primes), [])
  end

  def prime_factors(_, [], found), do: found
  def prime_factors(n, [h | t], found) do
    if rem(n, h) == 0 do
      prime_factors(trunc(n / h), t, found ++ [h])
    else
      prime_factors(n, t, found)
    end
  end

  defp smaller(n, list), do: Enum.take_while(list, &(&1 < n))
end

IO.inspect EulerFortySeven.solve

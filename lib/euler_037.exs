defmodule EulerThirtySeven do
  import IntMath
  import NumHelpers

  @moduledoc """
  The number 3797 has an interesting property. Being prime itself, it is
  possible to continuously remove digits from left to right, and remain prime
  at each stage: 3797, 797, 97, and 7. Similarly we can work from right to
  left: 3797, 379, 37, and 3.

  Find the sum of the only eleven primes that are both truncatable from left to
  right and right to left.

  NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
  """
  def solve do
    trunc_primes(11, 0, 0)
  end

  def trunc_primes(_, total, found) when found == 11, do: total
  def trunc_primes(n, total, found) when rem(n, 5) == 0, do: trunc_primes(n + 2, total, found)
  def trunc_primes(n, total, found) do
    if trunc_prime?(n) do
      trunc_primes(n + 2, total + n, found + 1)
    else
      trunc_primes(n + 2, total, found)
    end
  end

  def trunc_prime?(n), do: Enum.all?(truncs(n), &prime?/1)

  def truncs(n), do: truncl(n) ++ truncr(n) -- [n]

  def truncl(n), do: truncl(n, [])
  def truncl(n, list) when n < 10, do: [n | list]
  def truncl(n, list), do: truncl(div(n, 10), [n | list])

  def truncr(n), do: truncr(n, [])
  def truncr(n, list) when n < 10, do: [n | list]
  def truncr(n, list), do: truncr(rem(n, logpow(n)), [n | list])
end

Timed.inspect EulerThirtySeven, :solve

defmodule EulerThirtyFive do
  import NumHelpers, only: [digits: 1]

  @moduledoc """
  The number, 197, is called a circular prime because all rotations of the
  digits: 197, 971, and 719, are themselves prime.

  There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
  73, 79, and 97.

  How many circular primes are there below one million?
  """
  def solve(limit // 1_000_000) do
    primes   = ESeive.primes(limit)
    primeset = HashSet.new(primes)

    Enum.filter(primes, fn(p) -> all_indivisible?(p) and is_circular?(p, primeset) end) |> length
  end

  def all_indivisible?(p) do
    digits(p) |> Enum.all?(&(&1 in [1, 3, 7, 9]))
  end

  def is_circular?(p, set) do
    rotations(p) |> Enum.all?(&(HashSet.member?(set, &1)))
  end

  def rotations(n) do
    rotations(n, [n], trunc(:math.log10(n)))
  end

  def rotations(_, list, times) when times == 0, do: list
  def rotations(n, list, times) do
    p = IntMath.pow(10, trunc(:math.log10(n)))
    q = div(n, p)
    r = rem(n, p)
    x = (r * 10 + q)

    rotations(x, [x | list], times - 1)
  end
end

Timed.inspect EulerThirtyFive, :solve

defmodule EulerFourHundredThirtyNine do
  import Calc

  @moduledoc """
  Let d(k) be the sum of all divisors of k.
  We define the function S(N) = ∑1≤i≤N ∑1≤j≤N d(i·j).
  For example, S(3) = d(1) + d(2) + d(3) + d(2) + d(4) + d(6) + d(3) + d(6) + d(9) = 59.

  You are given that S(10^3) = 563576517282 and S(10^5) mod 10^9 = 215766508.
  Find S(10^11) mod 10^9.

  REFERENCE:
  http://planetmath.org/FormulaForSumOfDivisors
  http://math.stackexchange.com/questions/22721/is-there-a-formula-to-calculate-the-sum-of-all-proper-divisors-of-a-number
  """
  def solve do
    Enum.take(sequence, 80) |> Enum.map(&pentagonal/1)
  end

  def sequence do
    Stream.iterate(1, fn
      (n) when n > 0  -> n * -1
      (n) when n < 0  -> (n * -1) + 1
    end)
  end

  def pentagonal(n) do
    round(((3 * (n * n)) - n) / 2)
  end

  def sumd(n) do
    List.flatten(combd(n)) |> Calc.sum
  end
end

IO.puts inspect(EulerFourHundredThirtyNine.solve)

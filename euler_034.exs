defmodule EulerThirtyFour do
  import NumHelpers

  @moduledoc """
  1! + 4! + 5! = 1 + 24 + 120 = 145

  Find the sum of all numbers which are equal to the sum of the factorial of
  their digits

  NOTE: There are only four of these numbers. They are known as Factorions.
  """

  @factorials HashDict.new([
    {0,1}, {1,1}, {2,2}, {3,6}, {4,24}, {5,120}, {6,720}, {7,5040}, {8,40320}, {9,362880}
  ])

  def solve do
    Enum.filter(10..(fac(7) + fac(8)), &fac_sum?/1) |> Enum.reduce(0, &(&1 + &2))
  end

  def fac(n),      do: HashDict.fetch!(@factorials, n)
  def fac_sum?(n), do: (digits(n) |> Enum.reduce(0, &(HashDict.fetch!(@factorials, &1) + &2))) == n
end

Timed.inspect EulerThirtyFour, :solve

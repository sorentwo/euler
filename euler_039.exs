defmodule EulerThirtyNine do
  @moduledoc """
  If p is the perimeter of a right angle triangle with integral length sides,
  {a,b,c}, there are exactly three solutions for p = 120.

  {20,48,52}, {24,45,51}, {30,40,50}

  For which value of p ≤ 1000, is the number of solutions maximised?
  """
  def solve do
    Enum.max_by(120..1000, fn(n) -> length(perimeters(n)) end)
  end

  def perimeters(n) do
    for a <- 3..n, b <- 3..n, a < b, pythagorean?(a, b, n - a - b), do: {a,b,n - a - b}
  end

  defp pythagorean?(a,b,c), do: a * a + b * b == c * c
end

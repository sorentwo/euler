defmodule EulerFifteen do
  @moduledoc """
  Starting in the top left corner of a 2×2 grid, and only being able to move to
  the right and down, there are exactly 6 routes to the bottom right corner.

  How many such routes are there through a 20×20 grid?
  """
  def solve(n // 20, k // 20) do
    round(fac(n + k) / (fac(n) * fac(k)))
  end

  def fac(1), do: 1
  def fac(n), do: n * fac(n - 1)
end

IO.puts inspect(EulerFifteen.solve)

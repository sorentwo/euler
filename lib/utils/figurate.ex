defmodule Figurate do
  def pentagonal(n),  do: trunc(n * ((3 * n) - 1) / 2)
  def pentagonal?(n), do: figurate?(n, 24, 6)

  def hexagonal(n),  do: n * (2*n - 1)
  def hexagonal?(n), do: figurate?(n, 8, 4)

  def triangular(n),  do: trunc(n * (n + 1) / 2)
  def triangular?(n), do: figurate?(n, 8, 2)

  def figurate?(n, x, y) do
    x = ((:math.sqrt(x * n + 1)) + 1) / y
    x == trunc(x)
  end
end

defmodule EulerTwenty do
  @moduledoc """
  n! means n × (n − 1) × ... × 3 × 2 × 1

  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  Find the sum of the digits in the number 100!
  """
  def solve(n // 100) do
    fac(n)
      |> integer_to_binary
      |> String.graphemes
      |> Enum.map(&binary_to_integer/1)
      |> Enum.reduce(0, &(&1 + &2))
  end

  def fac(1), do: 1
  def fac(n), do: n * fac(n - 1)
end

IO.puts inspect(EulerTwenty.solve)

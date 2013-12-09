defmodule EulerSix do
  @doc """
  The sum of the squares of the first ten natural numbers is,
  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,
  (1 + 2 + ... + 10)^2 = 552 = 3025

  Hence the difference between the sum of the squares of the first ten natural
  numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.
  """
  def solve(n // 100) do
    square_of_sum((0..n)) - sum_of_squares((0..n))
  end

  def sum_of_squares(seq) do
    Enum.reduce(seq, 0, fn(x, acc) -> (x * x) + acc end)
  end

  def square_of_sum(seq) do
    sum = Enum.reduce(seq, 0, fn(x, acc) -> x + acc end)

    sum * sum
  end
end

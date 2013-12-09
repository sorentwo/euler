defmodule NumHelper do
  def digits(n), do: digits(n, [])
  def digits(n, list) when n < 10, do: [n | list]
  def digits(n, list), do: digits(div(n, 10), [rem(n, 10) | list])

  def prime?(x) when x in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], do: true
  def prime?(x) do
    Enum.all?((2..round(:math.sqrt(abs(x)))), fn(n) -> rem(x, n) != 0 end)
  end

  def divisors(1), do: [1]
  def divisors(2), do: [1, 2]
  def divisors(3), do: [1, 3]
  def divisors(n), do: [1] ++ Enum.filter(2..round(n / 2), &(rem(n, &1) == 0)) ++ [n]
end

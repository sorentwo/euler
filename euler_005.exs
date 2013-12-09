defmodule EulerFive do
  @doc """
  2520 is the smallest number that can be divided by each of the numbers from 1
  to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?
  """
  def solve do
    Stream.iterate(20, &1 + 20)
      |> Enum.find(fn(n) -> div_by_all?([11,12,13,14,15,16,17,18,19,20], n) end)
  end

  def div_by_all?(list, x) do
    Enum.all?(list, fn(n) -> rem(x, n) == 0 end)
  end
end

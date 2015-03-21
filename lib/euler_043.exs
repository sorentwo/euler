defmodule EulerFortyThree do
  import EnumHelper

  @moduledoc """
  The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
  each of the digits 0 to 9 in some order, but it also has a rather interesting
  sub-string divisibility property.

  Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note
  the following:

      d2d3d4=406 is divisible by 2
      d3d4d5=063 is divisible by 3
      d4d5d6=635 is divisible by 5
      d5d6d7=357 is divisible by 7
      d6d7d8=572 is divisible by 11
      d7d8d9=728 is divisible by 13
      d8d9d10=289 is divisible by 17

  Find the sum of all 0 to 9 pandigital numbers with this property.
  """
  @primes [2, 3, 5, 7, 11, 13, 17]
  @ranges [1..3, 2..4, 3..5, 4..6, 5..7, 6..8, 7..9]
  def solve do
    properties = Enum.zip(@primes, @ranges)

    permutations(Enum.to_list(0..9))
    |> Enum.map(&array_to_binary/1)
    |> Enum.filter(&(all_divisible?(properties, &1)))
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
  end

  defp all_divisible?(properties, binary) do
    Enum.all?(properties, fn({prime, range}) ->
      slice_div_by?(binary, range, prime)
    end)
  end

  defp slice_div_by?(bin, range, by) do
    (String.slice(bin, range) |> String.to_integer |> rem(by)) == 0
  end

  defp array_to_binary(array) do
    Enum.reduce(array, "", fn (n, a) -> a <> Integer.to_string(n) end)
  end
end

IO.puts inspect(EulerFortyThree.solve)

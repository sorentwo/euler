defmodule EulerFour do
  @doc """
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  def solve do
    Enum.map(tuples, fn({a,b}) -> a * b end)
      |> Enum.filter(&palindrome?/1)
      |> Enum.max
  end

  def tuples do
    lc x inlist Enum.to_list(999..100), y inlist Enum.to_list(999..100), do: {x, y}
  end

  def palindrome?(n) do
    integer_to_binary(n) == String.reverse(integer_to_binary(n))
  end
end

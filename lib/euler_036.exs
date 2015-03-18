defmodule EulerThirtySix do
  @moduledoc """
  The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

  Find the sum of all numbers, less than one million, which are palindromic in
  base 10 and base 2.

  (Please note that the palindromic number, in either base, may not include leading zeros.)
  """
  def solve(limit) do
    Stream.iterate(1, &(&1 + 2))
      |> Enum.take_while(&(&1 < limit))
      |> Enum.filter(&multi_palindromic?/1)
      |> Enum.reduce(0, &(&1 + &2))
  end

  def multi_palindromic?(n) do
    palindromic?(integer_to_graphemes(n, 10)) and palindromic?(integer_to_graphemes(n, 2))
  end

  def integer_to_graphemes(n, base) do
    String.graphemes(integer_to_binary(n, base))
  end

  def palindromic?(graphemes) do
    graphemes == Enum.reverse(graphemes)
  end
end

Timed.inspect EulerThirtySix, :solve, [1_000_000]

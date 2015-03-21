defmodule EulerFortyOne do
  import EnumHelper
  import NumHelper

  @moduledoc """
  We shall say that an n-digit number is pandigital if it makes use of all the
  digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
  also prime.

  What is the largest n-digit pandigital prime that exists?
  """
  def solve do
    Enum.map((9..4), fn(n) -> n..1 |> Enum.to_list end)
    |> Enum.flat_map(&permutations/1)
    |> Enum.sort
    |> Enum.reverse
    |> Enum.find(&prime_list?/1)
  end

  defp prime_list?(arr), do: array_to_int(arr) |> prime?

  defp array_to_int(array) do
    Enum.reduce(array, "", fn(x,a) ->
      a <> Integer.to_string(x)
    end) |> String.to_integer
  end
end

IO.puts inspect(EulerFortyOne.solve)

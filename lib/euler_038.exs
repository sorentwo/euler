defmodule EulerThirtyEight do
  @moduledoc """
  Pandigital multiples

  Take the number 192 and multiply it by each of 1, 2, and 3:

  192 × 1 = 192
  192 × 2 = 384
  192 × 3 = 576
  By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
  call 192384576 the concatenated product of 192 and (1,2,3)

  The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
  5, giving the pandigital, 918273645, which is the concatenated product of 9 and
  (1,2,3,4,5).

  What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
  concatenated product of an integer with (1,2, ... , n) where n > 1?
  """

  def solve do
    9876..9
    |> Enum.map(&pandigitize/1)
    |> Enum.filter fn({_, x}) -> x != nil && is_pandigital?(x) end
  end

  defp is_pandigital?(int) when is_integer(int) do
    is_pandigital?(int |> Integer.to_char_list)
  end
  defp is_pandigital?(list) when is_list(list) do
    length(list) == length(Enum.uniq(list))
  end

  defp pandigitize(m), do: pandigitize({m,''}, 1)
  defp pandigitize({m, acc}, _) when length(acc) == 9, do: {m, acc}
  defp pandigitize({m, acc}, _) when length(acc) >= 10, do: {m, nil}
  defp pandigitize({m, acc}, n) when length(acc) < 10 do
    pandigitize({m, acc ++ Integer.to_char_list(m * n)}, n + 1)
  end
end

IO.inspect EulerThirtyEight.solve

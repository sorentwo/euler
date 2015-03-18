defmodule EulerThirtyEight do
  import NumHelper
  import EnumHelper

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
    conprod?([9,1,8,2,7,3,6,4,5], 5, 2)
    # Enum.filter(pandigitals, fn([head | _]) -> head == 9 end)
    #   |> Enum.sort
    #   |> Enum.reverse
    #   |> Enum.find(&conprod?/1)
  end

  def pandigitals do
    perms([1,2,3,4,5,6,7,8,9])
  end

  def to_dig(list), do: Enum.join(list) |> binary_to_integer
end

IO.inspect EulerThirtyEight.solve

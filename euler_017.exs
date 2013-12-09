defmodule EulerSeventeen do
  @moduledoc """
  If the numbers 1 to 5 are written out in words: one, two, three, four, five,
  then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers from 1 to 1000 (one thousand) inclusive were written out
  in words, how many letters would be used?

  NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
  forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
  letters. The use of "and" when writing out numbers is in compliance with
  British usage.
  """
  @ones %w(
    - one two three four five six seven eight nine ten eleven twelve thirteen
    fourteen fifteen sixteen seventeen eighteen nineteen
  )

  @tens %w(
    twenty thirty forty fifty sixty seventy eighty ninety
  )

  def solve(n // 1000) do
    Enum.map(1..n, &to_word/1)
  end

  def ones, do: @ones
  def tens, do: @tens

  def to_word(n) when n < 20, do: Enum.at(@ones, n)
  def to_word(n) when n > 19 and n < 100 do
    n
  end
  def to_word(n) do
    n
  end
end

IO.puts inspect(EulerSeventeen.solve)

defmodule EulerFourteen do
  @moduledoc """
  The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
  """
  def solve(limit // 1_000_000) do
    Enum.max_by(2..limit, fn(n) -> chain(n, 0) end)
  end

  def chain(n, l) when n <= 1, do: l
  def chain(n, l) when n > 1 do
    if rem(n, 2) == 0 do
      chain(round(n / 2), l + 1)
    else
      chain(round((3 * n) + 1), l + 1)
    end
  end
end

IO.puts inspect(EulerFourteen.solve)

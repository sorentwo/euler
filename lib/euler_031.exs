defmodule EulerThirtyOne do
  @moduledoc """
  In England the currency is made up of pound, £, and pence, p, and there are
  eight coins in general circulation:

  1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
  It is possible to make £2 in the following way:

  1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
  How many different ways can £2 be made using any number of coins?
  """

  def solve(amount // 200, coins // [1, 2, 5, 10, 20, 50, 100, 200]) do
    {n, _} = count(amount, coins, HashDict.new)
    n
  end

  def count(0, _, dict), do: {1, dict}
  def count(n, _, dict) when n < 0, do: {0, dict}
  def count(_, [], dict), do: {0, dict}
  def count(n, coins = [coin | rest], dict) do
    if HashDict.has_key?(dict, {n, length(coins)}) do
      {HashDict.fetch!(dict, {n, length(coins)}), dict}
    else
      {n1, d1} = count(n - coin, coins, dict)
      {n2, d2} = count(n, rest, d1)
      {n1 + n2, HashDict.put(d2, {n, length(coins)}, n1 + n2)}
    end
  end
end

t1 = :os.timestamp
answer = EulerThirtyOne.solve
t2 = :os.timestamp

IO.inspect "#{answer} in #{:timer.now_diff(t2, t1) / 1000}"

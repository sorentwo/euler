defmodule EulerTen do
  @doc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """
  def solve(n // 2_000_000) do
    sequence
      |> Stream.filter(&prime?/1)
      |> Stream.take_while(&1 < n)
      |> Enum.reduce(0, &1 + &2)
  end

  def sequence do
    Stream.iterate(0, &1 + 1)
  end

  def prime?(x) when x in [2, 3, 5, 7, 11, 13, 17], do: true
  def prime?(x) do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end
end

IO.puts inspect(EulerTen.solve)

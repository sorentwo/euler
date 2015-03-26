defmodule EulerFortySix do
  import PrimeSieve

  @moduledoc """
  It was proposed by Christian Goldbach that every odd composite number
  can be written as the sum of a prime and twice a square.

  9 = 7 + 2×1^2
  15 = 7 + 2×2^2
  21 = 3 + 2×3^2
  25 = 7 + 2×3^2
  27 = 19 + 2×2^2
  33 = 31 + 2×1^2

  It turns out that the conjecture was false.

  What is the smallest odd composite that cannot be written as the sum
  of a prime and twice a square?
  """
  @primes primes(5000)

  def solve do
    uncomposable!(7)
  end

  def uncomposable!(n) do
    if prime?(n) || composable?(n) do
      uncomposable!(n + 2)
    else
      n
    end
  end

  def composable?(n) do
    smaller = Enum.take_while(@primes, &(&1 < n))

    Enum.any?(smaller, &(squarable?(n, &1)))
  end

  defp squarable?(n, x) do
    root = :math.sqrt((n - x) / 2)
    trunc(root) == root
  end
end

IO.puts inspect(EulerFortySix.solve)

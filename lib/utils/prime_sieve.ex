defmodule PrimeSieve do
  @moduledoc """
  1. Create a list l of consecutive integers {2,3,…,N}.
  2. Select p as the first prime number in the list, p=2.
  3. Remove all multiples of p from the l.
  4. Set p equal to the next integer in l which has not been removed.
  5. Repeat steps 3 and 4 until p^2 > N, all the remaining numbers in the list are primes
  """
  def primes(n) do
    numbers    = 2..(n - 1)
    dict       = dense_dict(numbers)
    {_, pdict} = Enum.reduce(numbers, {n, dict}, &find_prime/2)

    HashDict.keys(pdict) |> Enum.sort
  end

  def prime?(x) when x in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], do: true
  def prime?(x) do
    Enum.all?((2..round(:math.sqrt(abs(x)))), fn(n) -> rem(x, n) != 0 end)
  end

  def find_prime(n, {limit, dict}) do
    find_prime(HashDict.fetch(dict, n), n, {limit, dict})
  end

  def find_prime(:error, _, acc), do: acc
  def find_prime({:ok, _}, n, {limit, dict}) do
    reduced = Stream.iterate(n * n, &(&1 + n))
      |> Enum.take_while(&(&1 < limit))
      |> Enum.reduce(dict, fn(x, dict) -> HashDict.delete(dict, x) end)

    { limit, reduced }
  end

  defp dense_dict(numbers) do
    Enum.reduce(numbers, HashDict.new, fn(k, dict) ->
      HashDict.put(dict, k, {k, true})
    end)
  end
end

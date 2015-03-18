defmodule EulerNine do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for
  which, a^2 + b^2 = c^2

  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  def solve(n // 1000) do
    gen_c(n) |> gen_tuples(n) |> Enum.find(&pythagorean?/1) |> product
  end

  def gen_c(limit) do
    Stream.iterate(seed(limit), &1 + 2) |> Enum.take_while(&1 < limit)
  end

  def gen_tuples(c_list, total) do
    Enum.flat_map(c_list, fn(n) -> gen_abc(n, total) end)
  end

  def gen_abc(c, total) do
    Enum.map(2..(total - c), fn(b) -> {total - c - b, b, c} end)
      |> Enum.filter(fn({a,b,c}) -> a < b and a > 0 and b < c and total - (c + b) < b end)
  end

  def seed(limit) do
    seed = round(limit / 3)
    if rem(seed, 2) == 0 do
      seed - 1
    else
      seed
    end
  end

  def product({a,b,c}),      do: a * b * c
  def pythagorean?({a,b,c}), do: a*a + b*b == c*c
end

IO.puts inspect(EulerNine.solve)

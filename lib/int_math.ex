defmodule IntMath do
  use Bitwise

  def pow(_, 0), do: 1
  def pow(a, 1), do: a

  def pow(a, n) when band(n, 1) === 0 do
    tmp = pow(a, n >>> 1)
    tmp * tmp
  end

  def pow(a, n) do
    a * pow(a, n - 1)
  end

  def len(n) when n < 1, do: 0
  def len(n) when n < 10, do: 1
  def len(n) when n < 100, do: 2
  def len(n) when n < 1000, do: 3
  def len(n) when n < 10000, do: 4
  def len(n) when n < 100000, do: 5
  def len(n) when n < 1000000, do: 6
  def len(n) when n < 10000000, do: 7
  def len(n), do: trunc(:math.log10(n))

  def logpow(n) do
    l = len(n)

    case l do
      1 -> 1
      2 -> 10
      3 -> 100
      4 -> 1000
      5 -> 10000
      6 -> 100000
      7 -> 1000000
      x -> pow(10, l)
    end
  end
end

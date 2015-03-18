defmodule EulerNineteen do
  @moduledoc """
  You are given the following information, but you may prefer to do some research
  for yourself.

  1 Jan 1900 was a Monday.
  Thirty days has September,
  April, June and November.
  All the rest have thirty-one,
  Saving February alone,
  Which has twenty-eight, rain or shine.
  And on leap years, twenty-nine.

  A leap year occurs on any year evenly divisible by 4, but not on a century
  unless it is divisible by 400.

  How many Sundays fell on the first of the month during the twentieth century (1
  Jan 1901 to 31 Dec 2000)?
  """
  @weekdays %w[sun mon tue wed thu fri sat]
  @months   [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def solve do
    tomorrow({ 2, 1, 0, 1901 })
  end

  def tomorrow({ weekday, day, month, year }) do
    next_wee = iterate_weekday(weekday)
    next_day = iterate_day(day, Enum.at(@months, month))
    next_mon = iterate_month(day, Enum.at(@months, month), month)

    { next_wee, next_day, next_mon, year }
  end

  def iterate_weekday(w) when w == length(@weekdays) - 1, do: 0
  def iterate_weekday(w), do: w + 1

  def iterate_day(d, m) when d == m, do: 1
  def iterate_day(d, _), do: d + 1

  def iterate_month(d, l, m) when d == l and m == length(@months) - 1, do: 0
  def iterate_month(d, l, m) when d == l and m < length(@months) - 1, do: m + 1
  def iterate_month(d, l, m) when d != l, do: m
end

IO.inspect EulerNineteen.solve

defmodule Triangle do
  def to_matrix(binary) do
    String.split(binary, "\n", trim: true) |> Enum.map(&row_to_integers/1)
  end

  def row_to_integers(row) do
    String.strip(row) |> String.split(" ") |> Enum.map(&binary_to_integer/1)
  end

  def collapse([value]), do: value
  def collapse([head | [next | tail]]) do
    collapse([fold_row(head, next) | tail])
  end

  def fold_row(head, next) do
    Enum.map(0..(length(next) - 1), fn(n) -> fold_triangle(n, next, head) end)
  end

  def fold_triangle(index, head, next) do
    a = Enum.at(head, index)
    b = Enum.at(next, index)
    c = Enum.at(next, index + 1)

    if a + b > a + c, do: a + b, else: a + c
  end
end

defmodule ListMath do
  def sum(list), do: Enum.reduce(list, 0, &(&1 + &2))
end

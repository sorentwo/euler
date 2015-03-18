defmodule EnumHelper do
  def perms([]), do: [[]]
  def perms(list) do
    lc head inlist list, tail inlist perms(list -- [head]), do: [head|tail]
  end
end

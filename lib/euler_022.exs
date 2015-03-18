defmodule EulerTwentyTwo do
  @moduledoc """
  Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
  containing over five-thousand first names, begin by sorting it into
  alphabetical order. Then working out the alphabetical value for each name,
  multiply this value by its alphabetical position in the list to obtain a name
  score.

  For example, when the list is sorted into alphabetical order, COLIN, which is
  worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
  obtain a score of 938 × 53 = 49714.

  What is the total of all the name scores in the file?
  """

  @values Enum.with_index(%w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]) |> HashDict.new

  def solve do
    names
      |> Enum.map(fn({ word, pos }) -> word_score(word) * (pos + 1) end)
      |> Enum.reduce(0, (&1 + &2))
  end

  def names do
    { :ok, lines } = File.open("data/names.txt", [:read], fn(file) ->
      IO.read(file, :line)
    end)

    String.replace(lines, "\"", "") |> String.split(",") |> Enum.sort |> Enum.with_index
  end

  def word_score(word) do
    String.graphemes(word) |> Enum.map(&char_score/1) |> Enum.reduce(0, &(&1 + &2))
  end

  def char_score("\n"), do: 0
  def char_score(char) do
    HashDict.fetch!(@values, char) + 1
  end
end

IO.inspect EulerTwentyTwo.solve

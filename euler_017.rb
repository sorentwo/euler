# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with
# British usage.

ONES_AND_TENS = %w[
  one two three four five six seven eight nine ten eleven twelve thirteen
  fourteen fifteen sixteen seventeen eighteen nineteen
].unshift(' ')

TIES = %w[twenty thirty forty fifty sixty seventy eighty ninety]

def to_word(n)
  if n < 20
    ONES_AND_TENS[n]
  elsif n > 19 && n < 100
    x, y = n.to_s[0].to_i - 2, n.to_s[1].to_i
    y < 0 ? TIES[x] : TIES[x] + to_word(y)
  elsif n > 99 && n < 1000
    x, y = n.to_s[0].to_i, n.to_s[1,2].to_i
    y < 1 ? ONES_AND_TENS[x] + ' hundred' :  ONES_AND_TENS[x] + ' hundred and ' + to_word(y).to_s
  elsif n > 999
    'one thousand'
  end
end

result = (0..1000)
  .map { |n| to_word(n) }
  .map { |w| w.gsub(/\s/, '').length }
  .reduce(0) { |acc, n| acc + n }

puts result

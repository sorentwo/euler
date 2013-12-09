a = Date.new(1901, 1, 1)
b = Date.new(2000, 12, 31)
s = 0

while(a < b) do
  s += 1 if a.cwday == 7 && a.mday == 1
  a = a.next
end

puts s

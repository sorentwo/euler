def num_divisors(n)
  n = n/2 if n % 2 == 0

  divisors = 1
  count = 0

  while n % 2 == 0 do
    count += 1
    n = n/2
  end

  divisors = divisors * (count + 1)

  p = 3

  while n != 1 do
    count = 0
    while n % p == 0 do
      count += 1
      n = n/p
    end

    divisors = divisors * (count + 1)
    p += 2
  end

  divisors
end

def find_triangular_index(factor_limit)
  n = 1
  lnum, rnum = num_divisors(n), num_divisors(n+1)

  while lnum * rnum < 500 do
    n += 1
    lnum, rnum = rnum, num_divisors(n+1)
  end

  n
end

start = Time.now
index = find_triangular_index(500)
triangle = (index * (index + 1)) / 2
finish = Time.now

puts "#{triangle} in #{finish - start}"

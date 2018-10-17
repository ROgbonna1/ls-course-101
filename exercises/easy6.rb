require 'pry'
## Question 1 ##
DEGREES = "\xC2\xB0"

def degrees(deci_degree)
  deci_degree.floor
end

def minutes(deci_degree)
  ((deci_degree - deci_degree.floor).round(10) * 60).floor
end

def seconds(deci_degree)
  decimal = (deci_degree - deci_degree.floor).round(10)
  seconds = ((decimal * 60) - minutes(deci_degree)) * 60
  seconds.round
end

def dms(deci_degree)
  sprintf("%02d#{DEGREES}%02d\'%02d\"",
  degrees(deci_degree), minutes(deci_degree), seconds(deci_degree))
end

## Question 2 ##
def remove_vowels(arr)
  arr.map { |str| str.delete('aeiouAEIOU') }
end

## Question 3 ##
def find_fibonacci_index_by_length(length)
  fib_n_2 = 1
  fib_n_1 = 1
  count = 2
  loop do
    fib_current = fib_n_1 + fib_n_2
    count += 1
    break if fib_current.to_s.length == length
    fib_n_1, fib_n_2 = fib_current, fib_n_1
  end
  count
end
binding.pry
puts "50#{DEGREES}"
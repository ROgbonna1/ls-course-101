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

## Question 4 ##
def reverse!(arr)
  ref_array = arr.dup
  length = ref_array.length
  for i in 1..length do
    arr << ref_array[length - i]
  end
  length.times {arr.shift}
  arr
end

## Question 5 ##
def reverse(arr)
  ref_array = arr.dup
  arr.each_with_index.map do |_, index|
    ref_array[ref_array.length - (index + 1)]
  end
end

## Question 6 ##
def merge(arr1, arr2)
  (arr1 + arr2).flatten.uniq
end

## Question 7 ##
def halvsies(arr)
  arr1 = []
  arr2 = []
  arr.each_with_index do |x, i|
    i + 1 <= ((arr.length + 1) / 2) ? arr1 << x : arr2 << x
  end
  [arr1, arr2]
end

## Question 8 ##
def find_dup(arr)
  arr.detect do |x|
    arr.count(x) == 2
  end
end

## Question 9 ##
def include?(arr, arg)
  arr.any? { |x| x == arg }
end

## Question 10 ##
def triangle(size)
  height = 0
  loop do
    print " " * (size - height)
    print "*" * (height)
    print "\n"
    height += 1
    break if height > size
  end
end

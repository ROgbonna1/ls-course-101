require 'pry'

## Question 1 ##
def rotate_array(arr)
  new_arr = arr.dup
  new_arr << new_arr.slice!(0)
  new_arr
end

## Question 2 ##
def rotate_rightmost_digits(num, n)
  num_chars = num.to_s.chars
  (num_chars[0...-n] + rotate_array(num_chars[-n..-1])).join.to_i
end

## Question 3 ##
def max_rotation(num)
  i = num.to_s.length
  new_num = num
  loop do
    new_num = rotate_rightmost_digits(new_num, i)
    i -= 1
    break if i == 1
  end
  new_num
end

## Question 4 ##
def light_switch(num)
  lights = Array.new(num, false)
  1.upto(num) do |round|
    lights = lights.each_with_index.map do |light, idx|
      (idx + 1) % round == 0 ? !light : light
    end
  end
  lights
end

def light_switch_nums(num)
  light_arr = []
  light_switch(num).each_with_index do |light, idx|
    light_arr << (idx + 1) if light == true 
  end
  light_arr
end

## Question 5 ##
def diamond(width)
  mid = width / 2
  i = 1
  loop do
    puts " " * mid + "*" * i
    mid -= 1
    i += 2
    break if i == width
  end
  puts "*" * width
  loop do
    mid += 1
    i -= 2
    puts " " * mid + "*" * i
    break if i == 1
  end
end

## Question 6 ##
def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end
end

## Question 7 ##
NUM_HASH = { "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5,
             "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9 }

def word_to_digit(sentence)
  NUM_HASH.keys.each do |word|
    sentence.gsub!(/#{word}/,NUM_HASH[word].to_s)
  end
  sentence
end

## Question 8 ##
def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

## Question 9 ##
def fibonacci(n) # non-recursive
 x, y, z = [1, 1, 1]
 (n - 2).times do
  z = x + y
  x, y = y, z
 end
 z
end

## Question 10 ##
def fibonacci_last(n)
  fibonacci(n) % 10
end
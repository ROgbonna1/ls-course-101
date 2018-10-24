require 'pry'

## Question 1 ##
def greetings(name_array, job_hash)
  puts "=> Hello, #{ job_hash[:title] } #{ name_array.join(" ") }! 
  You're a great #{ job_hash[:occupation] }!"
end

## Question 2 ##
def is_double_num?(num)
  num_length = num.to_s.length
  mid = num_length / 2
  num.to_s.length.even? && num.to_s[0...(mid)] == num.to_s[(mid)..-1]
end

def twice(num)
  is_double_num?(num) ? num : num * 2
end

## Question 3 ##
def negative(num)
  num > 0 ? (-num) : num
end

## Question 4 ##
def sequence(num)
  arr = []
  1.upto(num) { |x| arr << x }
  arr
end

## Question 5 ##
def uppercase?(str)
  str == str.upcase
end

## Question 6 ##
def word_lengths(phrase)
  phrase.split.map do |word|
    [word, word.length].join(" ")
  end
end

## Question 7 ##
def swap_name(full_name)
  full_name.split.reverse.join(", ")
end

## Question 8 ##
def sequence(count, mult)
  arr = []
  1.upto(count) { |x| arr << x * mult }
  arr
end

## Question 9 ##
GRADE = { A: (90..100), B: (80...90), C: (70...80), D: (60...70), E: (0...60) }
def get_grade(scr1 = 0, scr2 = 0, scr3 = 0)
  avg = (scr1 + scr2 + scr3) / 3
  GRADE.select { |_, value| value.include?(avg) }.keys[0].to_s
end

## Question 10 ##
def buy_fruit(list)
  list.map { |fruit, quant| [fruit] * quant }.flatten
end
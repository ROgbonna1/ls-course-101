require "pry"

## Question 1 ##
def repeat(phrase, num)
  num.times {print phrase}
end


## Question 2 ##
def is_odd?(num)
  num % 2 == 0
end

## Question 3 ##
def digit_list(num)
  num.to_s.split('').map { |x| x.to_i }
end

## Question 4 ##
def count_occurrences(cars)
  occurrences = {}
  cars.each do |car|
    if occurrences.has_key? car
      occurrences[car] += 1
    else
      occurrences[car] = 0
    end
  end
  occurrences
end

## Question 5 ##
def reverse_sentence(sentence)
  sentence.split.reverse.join(" ")
end

## Question 6 ##
def reverse_words(sentence)
  sentence.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(" ")
end

## Question 7 ##
def stringy(num)
  string = ''
  num.times { |count| count.even? ?  string << '1' : string << '0' }
  return string
end

## Question 8 ##
def average(nums)
  sum = 0
  nums.each {|num| sum += num}
  sum / nums.count
end

## Question 9 ##
def sum(number)
  sum = 0
  number.to_s.split('').each {|digit| sum += digit.to_i}
  sum
end

def sum2(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

## Question 10 ##
def calculate_bonus(salary, bool)
  bool ? salary * 0.5 : 0
end

binding.pry
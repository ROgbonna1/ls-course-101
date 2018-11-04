require 'pry'

## Question 1 ##
sample_text = File.read('sample_text.txt')

def longest_sentence(text)
  text.split(/\.|\?|!/).max { |a, b| a.length <=> b.length }
end

## Question 2 ##
BLOCK = { B: "O",   X: "K",   D: "Q",   C: "P",   N: "A",
G: "T",   R: "E",   F: "S",   J: "W",   H: "U",
V: "I",   L: "Y",   Z: "M" }

def block_word?(word)
  hash = BLOCK.select do |k, v| 
    word.count(k.to_s) + word.count(v) >= 2
  end
  hash.size == 0
end

## Question 3 ##
def letter_percentages(str)
  percentages = {}
  total = str.length
  percentages[:lowercase] = str.count("a-z") / total.to_f * 100
  percentages[:uppercase] = str.count("A-Z") / total.to_f * 100
  percentages[:neither] = 100 - percentages[:uppercase] - percentages[:lowercase]
  percentages
end

## Question 4 ##
def balanced?(str)
  pars = str.chars.keep_if { |x| x == "(" || x == ")" }
  check = []
  pars.each do |par|
    check << par + pars.delete_at(pars.find_index(")"))
  end
  check.none? { |set| set != "()" }
end

## Question 5 ##
def triangle(sides)
  sides.sort!
  if sides[0] + sides[1] <= sides[2]
    :invalid
  elsif sides.uniq.size == 1
    :equilateral
  elsif sides[0] == sides[1] 
    :isosceles
  else
    :scalene
  end
end

## Question 6 ##
def triangle(ang1, ang2, ang3)
  angs = [ang1, ang2, ang3]
  case
  when angs.any? { |x| x >= 180 || x <= 0 } || angs.sum != 180
    :invalid
  when angs.any? { |x| x > 90 }
    :obstuse
  when angs.any? { |x| x == 90 }
    :right
  when angs.all? { |x| x < 90 }
    :acute
  end
end

## Question 7 ##
def friday_13th(year)
  date = Time.new(year)
  calendar = []
  loop do
    calendar << date if date.friday? && date.day == 13
    date += (60 * 60 * 24)
    break if date.year != year
  end
  calendar.size
end

## Question 8 ##
def is_featured?(num)
  num.odd? && num % 7 == 0 && num.to_s.chars.uniq.join.to_i == num
end

def featured(num)
  loop do
    num += 1
    return num if is_featured?(num)
    return "Invalid" if num > 9_999_999_999
  end
end

## Question 9 ##
def bubble_sort!(array)
  loop do
    swapcount = 0
    0.upto(array.size - 2) do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapcount =+ 1
      end
    end
    break if swapcount == 0
  end
  array
end

## Question 10 ##
def sum_square_difference(num)
  sum_of_squares = 1.upto(num).to_a.sum { |x| x ** 2 }
  square_of_sum = (1.upto(num).to_a.sum) ** 2
  square_of_sum - sum_of_squares
end

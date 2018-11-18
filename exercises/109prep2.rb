require 'pry'
=begin
- ASK USER FOR INT > 0
- VALIDATE THAT IT IS INT
- IF INVALID ASK FOR INT
- WHEN VALID, ASK FOR SUM OR PRODUCT
- IF SUM, SUM ALL INTEGERS FROM 1.upto(INT)
- IF PRODUCT, MULTIPLY ALL INTEGERS FROM 1.upto(INT)
=end

=begin  QUESTION 1
def prompt(msg)
  puts "==> #{msg}"
end

int = ""

loop do
  prompt "Enter an integer greater than zero!"
  int = gets.chomp
  break if int == int.to_i.to_s
  prompt "Invalid entry. Please select an INTEGER greater than 0"
end

int = int.to_i

calc = ""
loop do
  prompt "Do you want to calculate a sum or product? ('s' or 'p')"
  calc = gets.chomp.downcase
  break if calc == 's' || calc == 'p'
  prompt "Invalid entry. Please enter 's' or 'p'!"
end

if calc == 's'
  prompt "The sum of all integers between 1 and #{int} is #{(1..int).reduce(:+)}"
else
  prompt "The product of all integers between 1 and #{int} is #{(1..int).reduce(:*)}"
end
=end

=begin
- initialize new empty array variable
- loop through arr1 and shovel index of arr1 AND arr2 to new variable
- return
=end
def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |x, i|
    new_arr << x
    new_arr << arr2[i]
  end
  new_arr
end

=begin
arr1 = [1, 2, 3]
arr2 = ["a", "b", "c"]
p interleave(arr1, arr2)
p arr1
p arr2
=end

def leapyear?(year)
  year % 4 == 0 && year % 400 !=0
end

def friday_13th?(day)
  day.friday? && day.day == 13
end

def friday_13th_count(year)
  if leapyear?(year)
    calendar = Date.new(year)..Date.new(year) + 366
  else
    calendar = Date.new(year)..Date.new(year) + 365
  end
  calendar.count { |day| friday_13th?(day) }
end

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided_by)

def mathphrase(num)
  math_array = []
  math_array << NUMBERS.sample
  num.times do
    math_array << OPERATORS.sample
    math_array << NUMBERS.sample
  end
  math_array.join(" ")
end

def substring(str, start, fin = start)
  str[start..fin]
end

=begin
1.upto(str.legth - 2) 

=end
def substrings(str)
  str_arr = []
  0.upto(str.length - 2) do |index|
    index.upto(str.length - 1) do |sub_endpoint|
      str_arr << substring(str, index, sub_endpoint ) unless index == sub_endpoint
    end
  end
  str_arr
end
require 'pry'

## Question 1 ##
def sum_of_sums(arr)
  sum = 0
  arr.each_with_index do |num, i|
    sum += arr[0..i].sum
  end
  sum
end

## Question 2 ##
=begin
print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

sentence = "You are a #{adjective} #{noun} and you #{verb} #{adverb}!"

puts sentence
=end

## Question 3 ##
def substrings_at_start(str)
  list = []
  str.chars.each_with_index { |letter, i| list << str.chars[0..i].join }
  list
end

## Question 4 ##
def substrings(str)
  list = []
  loop do
    list << substrings_at_start(str)
    str.slice!(0)
    break if str.empty?
  end
  list.flatten
end

## Question 5 ##
def palindromes(str)
  substrings(str).select do |substring|
    substring == substring.reverse && substring.length > 1
  end
end

## Question 6 ##
def fizzbuzz(first, last)
  first.upto(last) do |num|
    if num % 3 == 0 && num % 5 == 0
      puts "fizzbuzz"
    elsif num % 3 == 0
      puts "fizz"
    elsif num % 5 == 0
      puts "buzz"
    else
      puts num
    end
  end
end

## Question 7 ##
def repeater(str)
  str.chars.map { |letter| letter * 2 }.join
end

## Question 8 ##
def double_consonants(str)
  word = ""
  str.each_char do |letter|
    if /[aeiou]/.match(letter) || /[^a-zA-Z]/.match(letter)
      word << letter
    else
      word << letter * 2
    end
  end
  word
end

## Question 9 ##
def reversed_number(num)
  num.to_s.reverse.to_i
end

## Question 10 ##
def center_of(str)
  mid = (str.length / 2) - 1
  str.length.even? ? str[mid..mid + 1] : str[mid+1]
end
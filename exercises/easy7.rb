require 'pry'

## Question 1 ##
def interleave(arr1, arr2)
  new_arr = []
  for i in 0...arr1.length do
    new_arr << arr1[i] << arr2[i]
  end
  new_arr
end

## Question 2 ##
def letter_case_count(str)
  count_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |letter|
    case letter
    when /[a-z]/
      count_hash[:lowercase] += 1
    when /[A-Z]/
      count_hash[:uppercase] += 1
    else
      count_hash[:neither] += 1
    end
  end
  count_hash
end

## Question 3 ##
def word_cap(phrase)
  phrase.split.map(&:capitalize).join(" ")
end

## Question 4 ##
def swapcase(str)
  new = ""
  str.split("").each do |letter|
    if letter =~ /[^a-zA-Z]/
      new << letter
    elsif letter.upcase == letter
      new << letter.downcase
    elsif letter.downcase == letter
      new << letter.upcase
    end
  end
  new
end

## Question 5 ##
def staggered_case(str)
  new = ""
  str.split("").each_with_index do |letter, index|
    if letter =~ /[^a-zA-Z]/
      new << letter
    elsif index % 2 == 0
      new << letter.upcase
    elsif index % 2 != 0
      new << letter.downcase
    end
  end
  new
end

## Question 6 ##
def staggered_case(str)
  new = ""
  capital = true
  str.chars.each do |letter|
    if letter =~ /[^a-zA-Z]/
      new << letter
    else
      capital ? new << letter.capitalize : new << letter.downcase
      capital = !capital
    end
  end
  new
end

## Question 7 ##
def show_multiplicative_average(arr)
  product = 1.to_f
  arr.each { |num| product *= num }
  format('%.3f', (product/arr.size))
end

## Question 8 ##
def multiply_list(arr1, arr2)
  new = []
  for i in 0...arr1.length do
    new << arr1[i] * arr2[i]
  end
  new
end

puts "hi"
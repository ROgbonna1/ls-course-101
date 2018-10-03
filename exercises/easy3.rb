require "pry"

## Question 1 ##
question1 = Proc.new do
  number_array = []
  
  def prompt(msg)
    puts "==> #{msg}"
  end
  
  def add_to_array(num, num_array)
    num_array << num
  end
  
  def num_request(num)
    prompt "Enter the #{num}th number:" unless num == 1 || num == 2 || num ==3
    prompt "Enter the 1st number:" if num == 1
    prompt "Enter the 2nd number:" if num == 2
    prompt "Enter the 3rd number:" if num == 3
  end
  
  def list_check(num, num_array)
    if num_array.include?(num)
      "The number #{num} is included in #{num_array}."
    else
      "The number #{num} is not included in #{num_array}."
    end
  end
  
  5.times do |i|
    num_request(i+1)
    add_to_array(gets.chomp, number_array)
  end
  
  prompt "Enter the last number:"
  
  prompt list_check(gets.to_i, number_array.map(&:to_i))
end

## Question 4 ##
def chars_no_spaces(str)
  str.count "^ "
end

## Question 8 ##
def xor?(bool1, bool2)
 ( bool1 && !bool2 ) || ( !bool1 && bool2 )
end

## Question 9 ##
def oddities(arr)
  arr.select {|x| arr.rindex(x).even?}
end

binding.pry
require 'pry'

## Question 1 ##
puts "Teddy is #{rand(20..200)} years old."

## Question 6 ##
for i in 1..99 do 
  puts i if i.odd? 
end

## Question 8 ##
def product(num)
  product = 1
  for i in 1..num do
    product *= i
  end
  product
end

binding.pry
require "pry"

## Question 1 ##
def repeat(phrase, num)
  num.times {print phrase}
end


## Question 2 ##
def is_odd?(num)
  num % 2 == 0
end
binding.pry
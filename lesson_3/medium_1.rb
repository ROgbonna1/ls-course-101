## Question 1 ##
10.times {|x| puts " " * x + "The Flintstones Rock!"}

## Question 2 ##
# puts "the value of 40 + 2 is " + (40 + 2) => can't force int into str
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"

## Question 3 ##
def factors(number)
  divisors = []
  for i in 1..number
    divisors << number / i if number % i == 0
  end
  divisors
end

## Question 4 ##
# Yes. The first implementation uses the destructive '<<' method.
# Thus, the variable 'buffer' will be modified as a result of the method call.
# 'rolling_buffer2' reassigns the variable and thus, no input arguments
# are changed.

## Question 5 ##
# That 'limit' variable is outside of the scope of the method.
# He should define 'limit' within the method or make it an argument.

## Question 6 ##
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

## Question 7 ##
# 34

## Question 8 ##
# rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# rps(rps("paper", "rock"), "rock")
# rps("paper", "rock")
# "paper"

## Question 10 ##
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# bar(foo) => bar("yes") => "no"
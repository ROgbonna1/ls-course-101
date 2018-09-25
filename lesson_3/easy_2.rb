## Question 1 ##
# Hash#key?
# Hash#include?
# Hash#member?
# Hash#fetch(key, default_value) => returns an error or default value if key 
#                                   not present
# Hash#values_at(key)            => returns an array of values associated with
#                                   key(s). Returns an 'nil' array otherwise.

## Question 2 ##
# String#capitalize
# String#swapcase
# String#downcase
# String#upcase

## Question 3 ##
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge! additional_ages

## Question 4 ##
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include? "Dino"

## Question 5 ##
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

## Question 6 ##
flintstones << "Dino"

## Question 7 ##
flintstones.push("Dino", "Hoppy")

## Question 8 ##
advice = "Few things in life are as important as house training your pet dinosaur."
# advice.slice!("as house training your pet dinosaur.")
advice.slice!(0, advice.index('house')) # much better

## Question 9 ##
statement = "The Flintstones Rock!"
statement.count('t')

## Question 10 ##
row_length = 40
title = "Flintstone Family Members"
space_offset = ( row_length - title.length ) / 2
space_offset.times { title.prepend(" ") }
puts title
40.times { print "-"}
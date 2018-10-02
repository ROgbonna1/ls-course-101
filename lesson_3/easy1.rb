## Question 1 ## 
# 1, 2, 2, 3. The method is only destructive with the bang operator.

## Question 2 ##
=begin
  1. what is != and where should you use it?
     Not equal to. Boolean comparisons
  2. put ! before something, like !user_name
     Converts user_name to a truthy boolean, then negates it to false.
  3. put ! after something, like words.uniq!
     Performs the method destructively
  4. put ? before something
     
  5. put ? after something
     Terniary comparison
  6. put !! before something, like !!user_name\
     Forces to a boolean, negates it to false, and negates it back to true.
=end

## Question 3 ##
# advice.gsub!(/important/, "urgent")

## Question 4 ##
# Array#delete(arg) deletes 'arg' from an array
# Array#delete_at(arg) deletes the element at index arg
# Note: both methods are destructive

## Question 5 ##
# (10...100).include?(42)

## Question 6 ##
# famous_words = "seven years ago..." + famous_words
# "four score and " << famous_words
# famous_words.prepend("four score and ")

## Question 7 ##
# Start with 2 and add_eight 5 times. 40+2 = 42

## Question 8 ##
# Array#flatten!

## Question 9 ##
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.select {|k, v| k == "Barney"}.to_a.flatten #my round-about method
flintstones.assoc("Barney") #better

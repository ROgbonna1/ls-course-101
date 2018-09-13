# asks the user for two numbers
# asks the user for an operation (addition, subtraction, multiplication, division)
# performs the operation
# returns the answer

Kernel.puts("Welcome to the Calculator App")
Kernel.puts("Please enter your first integer:")
integer1 = Kernel.gets().to_i
Kernel.puts("Thank you!")
Kernel.puts("Please enter your second integer:")
integer2 = Kernel.gets().to_i
Kernel.puts("Thank you!")
Kernel.puts("What operation would you like to perform.")
Kernel.puts("Enter '1' for addition.")
Kernel.puts("Enter '2' for subtraction.")
Kernel.puts("Enter '3' for multiplication.")
Kernel.puts("Enter '4' for division.")
operation = Kernel.gets().to_i

case operation
  when 1
    result = integer1 + integer2
  when 2
    result = integer1 - integer2
  when 3
    result = integer1 * integer2
  when 4
    result = integer1.to_f / integer2.to_f
end

Kernel.puts("Your result is: #{result}")
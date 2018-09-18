require 'pry'
require 'yaml'
# asks the user for two numbers
# asks the user for an operation
# -> (addition, subtraction, multiplication, division)
# performs the operation
# returns the answer

MESSAGES = YAML.load_file('calc.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

prompt MESSAGES["welcome"]

integer1 = 0
integer2 = 0

loop do 
  
  loop do
    prompt MESSAGES["integer"]
    integer1 = Kernel.gets().chomp
    
    if valid_number?(integer1)
      break
    else
      prompt MESSAGES['error']
    end
  end
  
  prompt("Thank you!")
  
  loop do
    prompt("Please enter your second integer:")
    integer2 = Kernel.gets().chomp
    if valid_number?(integer2)
      break
    else
      prompt "Try again, buddy."
    end
  end
  
  prompt("Thank you!")
  prompt("What operation would you like to perform.")
  prompt("Enter '1' for addition.")
  prompt("Enter '2' for subtraction.")
  prompt("Enter '3' for multiplication.")
  prompt("Enter '4' for division.")
  
  operation = ' '
  
  loop do
    operation = Kernel.gets().to_i
    if [1,2,3,4].include? operation
      break
      
    else
      prompt "Try again, bud."
    end
  end
  
  case operation
    when 1
      result = integer1.to_i + integer2.to_i
    when 2
      result = integer1.to_i - integer2.to_i
    when 3
      result = integer1.to_i * integer2.to_i
    when 4
      result = integer1.to_f / integer2.to_f
  end
  
  prompt("Your result is: #{result}")
  
  prompt("Another calculation?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  prompt "thank you, come again."
end
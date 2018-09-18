require 'pry'
require 'yaml'

=begin
Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

You'll need three pieces of information:

- the loan amount
- the Annual Percentage Rate (APR)
- the loan duration

From the above, you'll need to calculate the following two things:

- monthly interest rate
- loan duration in months
- You can use the following formula:

Mortgage Calculator Formula

Translated to Ruby, this is what the formula looks like:

m = p * (j / (1 - (1 + j)**(-n)))

-------------------------------------
Problem
- Take three inputs - loan amount, APR, and loan duration - and return the monthly payment 

Example
- For a $1000 loan, at a 5% APR, over the course of 5 years, 
  the borrower will be expected to make payments of 
  1000 * (0.05 / (1 - 1.05**-60) or approximately $52 per month.

Data Structure
- Will store loan amount, APR, and loan duration in variables

Algorithm
- m = p * (j / (1 - (1 + j)**(-n)))

=end

def prompt(command)
  puts "=> #{command}"
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  valid_float?(num) || valid_integer?(num)
end

# Initializing function variables outside of loop blocks
q = 0
j = 0
n = 0
repeat = "y"
PROMPTS = YAML.load_file('mortgage.yml')

puts <<-HEREDOC
*********************************************
#{PROMPTS['greeting']}
*********************************************
HEREDOC

while repeat == "y"

  loop do
    prompt "What is the principal amount of your loan?"
    q = gets.chomp
    
    break if valid_number? q
    
    prompt PROMPTS["error"]
  end
  
  loop do
    prompt "What is the APR for your loan?"
    j = gets.chomp
    
    break if valid_number? j
    
    prompt PROMPTS["error"]
  end
  
  loop do
    prompt "What is the duration of your loan in months?"
    n = gets.chomp
    
    break if valid_number? n
    
    prompt PROMPTS["error"]
  end
  
  m = q.to_f * (j.to_f / (1 - (1 + j.to_f)**-n.to_i))
  
  prompt "Your monthly payment: $#{m.round(2)}"
  
  prompt "\n Would you like to make another calculation? (Yes or No)"
  
  repeat = gets.chomp.downcase[0]
end

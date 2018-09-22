VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_result(player, cpu)
  if (player == 'rock'     && cpu == 'scissors') ||
     (player == 'scissors' && cpu == 'paper') ||
     (player == 'paper'    && cpu == 'rock')
    prompt("You won this round!")
    player
  elsif player == cpu
    prompt("This round is a tie!")
    nil
  else
    prompt("You lose this round!")
    cpu
  end
end

choice = ''
answer = ''




loop do
  round = 0
  prompt("Welcome to Rock, Paper, Scissors.") 
  prompt("How many rounds would you like to play?")
  rounds = gets.to_i
  
  while round < rounds
  
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets.chomp()
      
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("Not a valid choice. Try again.")
      end
    end
    
    computer_choice = VALID_CHOICES.sample()
    
    prompt("You chose: #{choice.capitalize}   
            Computer chose: #{computer_choice.capitalize}")
    
    display_result(choice, computer_choice)
    round += 1
    
  end
  
  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank you for playing!")
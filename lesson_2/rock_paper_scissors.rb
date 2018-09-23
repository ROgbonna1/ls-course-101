VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

## RPS game logic. Returns winner or 'nil' if tie.
def result(player, cpu)
  if (player == 'rock'     && cpu == 'scissors') ||
     (player == 'scissors' && cpu == 'paper') ||
     (player == 'paper'    && cpu == 'rock')
    player
  elsif player == cpu
    nil
  else
    cpu
  end
end

your_choice = ''
answer = ''

loop do
  round = 0
  player_wins = 0
  cpu_wins = 0
  total_rounds = ''
  
  prompt("Welcome to Rock, Paper, Scissors.") 
  
  loop do
    prompt("How many rounds would you like to play?")
    total_rounds = gets.chomp
    break if total_rounds.to_i.to_s == total_rounds
    prompt("Invalid. Integers only.")
  end
  
  while round < total_rounds.to_i
  
    # This loop asks users for a choice and breaks  
    # only if they select a valid option ("rock", "paper," or "scissors")
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      your_choice = Kernel.gets.chomp()
      
      if VALID_CHOICES.include?(your_choice)
        break
      else
        prompt("Not a valid choice. Try again.")
      end
    end
    
    computer_choice = VALID_CHOICES.sample()
    
    prompt("You chose: #{your_choice.capitalize} Computer chose: #{computer_choice.capitalize}")
    
    # Increment score and display winner based on result
    if result(your_choice, computer_choice) == your_choice
      player_wins += 1
      prompt("You win this round!")
    elsif result(your_choice, computer_choice) == computer_choice
      cpu_wins += 1
      prompt("You lose this round!")
    else
      prompt("This round is a tie!")
    end
    
    round += 1
    
    # Display score and round
    puts <<-SCOREBOARD
    -----------------------
        ROUND #{round}
    -----------------------
    USER SCORE: #{player_wins}
    CPU SCORE: #{cpu_wins}
    -----------------------
    SCOREBOARD
  end
  
  # Display winner of game
  if player_wins > cpu_wins
    prompt("You won the RPS Tournament!")
  elsif cpu_wins > player_wins
    prompt("You lost the RPS Tournament!")
  else
    prompt("This tournament was a tie!")
  end
  
  # Ask user if they want to play again.
  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp.downcase
  break unless answer.start_with?('y')
end


prompt("Thank you for playing!")
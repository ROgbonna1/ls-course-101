require "pry"
hearts =  ( ('2'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of hearts'
end

clubs = ( ('2'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of clubs'
end

spades = ( ('2'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of spades'
end

diamonds = ( ('2'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of diamonds'
end

# This method returns a random card from the deck and deletes it from the deck
def draw_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def card_value(card, hand) # returns the value all cards except aces
  if card[0].to_i.to_s == card[0]
    return card[0].to_i
  elsif card[0] != 'a'
    return 10
  end
end

def sum_aces(hand) # if an 11 will bust, returns a 1
  ace_count = hand.count { |card| card[0] == "a" }
  return 0 if ace_count == 0
  # Determine total number of ace point value combinations
  poss_point_combos = 
    ( [11]*ace_count + [1]*ace_count ).combination(ace_count).to_a.uniq
  # Rule out possibilities that would lead to 'bust'
  poss_point_combos.delete_if do |combo|
    ( combo.sum + sum_non_aces(hand) ) > 21
  end
  # Find the combo that results in a hand that is closests to 21
  best_combo = poss_point_combos.min_by do |combo| 
    21 - (combo.sum + sum_non_aces(hand))
  end
  best_combo.sum
end

def sum_non_aces(hand) # uses both value methods to return a total
  total = 0
  hand.select { |card| card[0] != "a" }.each do |card| 
    total += card_value(card, hand)
  end
  total
end

def sum_total(hand) # uses both value methods to return a total
  sum_non_aces(hand) + sum_aces(hand)
end

def display_board(hand1, hand2) # hand1 is player, hand2 is dealer
  puts <<-HEREDOC
  **********************************
  YOUR HAND: #{hand1}
  YOUR TOTAL: #{sum_total(hand1)}
  ---------------------
  DEALER HAND: #{hand2}
  DEALER TOTAL: #{sum_total(hand2)} 
  **********************************
  HEREDOC
end

def prompt(msg)
  puts "==> #{msg}"
end

def player_win?(hand1, hand2) # hand1 is player, hand2 is dealer
  ( 21 - sum_total(hand1) ) < ( 21 - sum_total(hand2) )
end

# Program Starts Here
loop do
  cards = [hearts, clubs, spades, diamonds].flatten
  dealer_hand = []
  player_hand = []
  hit_or_stay = ""
  answer = ""

  # Dealer starts with one card. Player draws two. Then display the table.
  dealer_hand << draw_card(cards)
  2.times { player_hand << draw_card(cards) }
  prompt("Welcome to Blackjack! Now shuffling cards...")
  sleep 1
  display_board(player_hand, dealer_hand)
  
  # This loop continuously asks the user to hit or stay until either the user
  # selects 'stay' or his total exceeds 21. Within this loop, program is 
  # validating user input. Will only accept "hit" or "stay" (case-insensitive)
  loop do
    loop do
      prompt("Hit or Stay")
      hit_or_stay = gets.chomp.downcase
      break if hit_or_stay == 'hit' || hit_or_stay == 'stay' 
      prompt("Invalid input. Please enter 'Hit' or 'Stay'")
    end
    break if hit_or_stay == 'stay'
    player_hand << draw_card(cards)
    display_board(player_hand, dealer_hand)
    break if sum_total(player_hand) >= 21 
  end
  
  
  #Check to see if player wins or busts. Otherwise, move on to dealer.
  if sum_total(player_hand) == 21
    prompt "You won! Congrats!"
  elsif sum_total(player_hand) > 21
    prompt "Busted! You lose!"
  else
    prompt("Dealer's turn...")
    # Dealer will continue to draw and display until he busts, wins, or hits 17.
    loop do
      sleep 2
      dealer_hand << draw_card(cards)
      display_board(player_hand, dealer_hand)
      break if sum_total(dealer_hand) >= 17 && 
               sum_total(dealer_hand) > sum_total(player_hand)
      prompt("Dealer hits again...")
    end
    
    sleep 2
    
    if sum_total(dealer_hand) == 21
      prompt "Dealer hit 21! You lose!"
    elsif sum_total(dealer_hand) > 21
      prompt "Dealer busted! You win!"
    else
      # If neither player nor dealer busts and dealer hits 17, a winner is decided
      prompt("Dealer stays...")
      prompt("Final Result...")
      sleep 2
      if player_win?(player_hand, dealer_hand) 
        prompt "YOU WIN!"
      elsif sum_total(player_hand) == sum_total(dealer_hand) 
        prompt "ITS A TIE!"
      else 
        prompt "YOU LOSE."
      end
    end
  end
  
  sleep 1
  
  prompt "Do you want to play again? y/n"
  answer = gets.chomp
  break if answer.downcase == "n"
end

prompt "Goodbye! Thanks for playing!"

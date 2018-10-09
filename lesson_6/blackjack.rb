require "pry"
hearts =  ( ('1'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of hearts'
end

clubs = ( ('1'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of clubs'
end

spades = ( ('1'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
  number + ' of spades'
end

diamonds = ( ('1'..'9').to_a + ['jack', 'queen', 'king', 'ace'] ).map do |number|
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

def ace_value(hand) # if an 11 will bust, returns a 1
  if hand.length <= 2
    return 11
  else
    new_hand = hand.dup
    new_hand.pop
    ( sum_total(new_hand) + 11 ) <= 21 ? 11 : 1
  end
end

def sum_total(hand) # uses both value methods to return a total
  total = 0
  hand.each do |card| 
    card[0] == 'a' ? total += ace_value(hand) : total += card_value(card, hand)
  end
  total
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
cards = [hearts, clubs, spades, diamonds].flatten
dealer_hand = []
player_hand = []
hit_or_stay = ""

# Dealer starts with one card. Player draws two. Then display the table.
dealer_hand << draw_card(cards)
2.times { player_hand << draw_card(cards) }
prompt("Welcome to Blackjack! Now shuffling cards...")
sleep 1
display_board(player_hand, dealer_hand)

=begin
This loop continuously asks the user to hit or stay until either the user
selects 'stay' or his total exceeds 21. Within this loop, program is validating
user input. Will only accept "hit" or "stay" (case-insensitive)
=end
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

=begin
Check to see if player wins or busts. Otherwise, move on to dealer.
=end
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
      prompt "You win!"
    elsif sum_total(player_hand) == sum_total(dealer_hand) 
      prompt "It's a tie!"
    else 
      prompt "You lose."
    end
  end
end

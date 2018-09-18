require "pry"

## Question 1 ##
def repeat(phrase, num)
  num.times {print phrase}
end


## Question 2 ##
def is_odd?(num)
  num % 2 == 0
end

## Question 3 ##
def digit_list(num)
  num.to_s.split('').map { |x| x.to_i }
end

## Question 4 ##
def count_occurrences(cars)
  occurrences = {}
  cars.each do |car|
    if occurrences.has_key? car
      occurrences[car] += 1
    else
      occurrences[car] = 0
    end
  end
  occurrences
end

## Question 5 ##
def reverse_sentence(sentence)
  sentence.split.reverse.join(" ")
end

## Question 6 ##
def reverse_words(sentence)
  sentence.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(" ")
end
binding.pry
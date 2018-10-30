require 'pry'

## Question 1 ##
sample_text = File.read('sample_text.txt')

def longest_sentence(text)
  text.split(/\.|\?|!/).max { |a, b| a.length <=> b.length }
end

## Question 2 ##
BLOCK = { B: "O",   X: "K",   D: "Q",   C: "P",   N: "A",
G: "T",   R: "E",   F: "S",   J: "W",   H: "U",
V: "I",   L: "Y",   Z: "M" }

def block_word?(word)
  hash = BLOCK.select do |k, v| 
    word.count(k.to_s) + word.count(v) >= 2
  end
  hash.size == 0
end

def letter_percentages(str)
  percentages = {}
  total = str.length
  percentages[:lowercase] = str.count("a-z") / total.to_f * 100
  percentages[:uppercase] = str.count("A-Z") / total.to_f * 100
  percentages[:neither] = 100 - percentages[:uppercase] - percentages[:lowercase]
  percentages
end




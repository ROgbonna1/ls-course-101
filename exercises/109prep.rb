require 'pry'
# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

def string_to_array(str)
  str_array = str.downcase.chars
  pairs_array = []
  str_array.each_with_index do |char, i|
    pairs_array << char + str_array[i+1] unless str[i + 1] == nil
  end
  pairs_array
end

def substring_test(str1, str2)
  string_to_array(str2).any? { |pair| string_to_array(str1).include?(pair) }
end

=begin
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true


=end

# Write a function that takes in a string of one or more words,
# and returns the same string, but with all five or more letter words
#  reversed. Strings passed in will
#   consist of only letters and spaces. Spaces will be included only
#  when more than one word is present.

def reverse_str(str)
  new_str = ""
  str.chars.each { |letter| new_str.prepend(letter) }
  new_str
end

def spin_words(sentence)
  sent_array = sentence.split(' ')
  sent_array.map { |word| word.length > 4 ? reverse_str(word) : word }.join(" ")
end

p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
p spin_words("This is a test") == "This is a test"
p spin_words("This is another test") == "This is rehtona test"

=begin
  - separate sentence into array
  - for string elements >= 5 characters, #reverse_string
  - join and return the sentence
=end


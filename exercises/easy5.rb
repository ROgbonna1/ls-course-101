require 'pry'

## Question 1 ##
def ascii_value(str)
  str.chars.map {|x| x.ord }.sum
end

## Question 2 ##
def time_of_day(mins)
  hours = ((mins / 60) % 24).to_s.rjust(2,'0')
  minutes = (mins % 60).to_s.rjust(2,'0')
  "#{hours}:#{minutes}"
end

## Question 3 ##
def before_midnight(time)
  ((24 - (time[0..1].to_i) - 1) * 60 + (60 - time[-2..-1].to_i)) % 1440
end

def after_midnight(time)
  ((time[0..1].to_i) % 24) * 60 + time[-2..-1].to_i
end

## Question 4 ##
def swap(str)
  words = str.split
  words.map do |word|
    if word.length > 1
      word << word.slice!(0)
      word.prepend(word.slice!(-2))
    else
      word
    end
  end.join(" ")
end

## Question 5 ##
def cleanup(str)
 str.gsub!(/\W+/, ' ').squeeze(' ') 
end

## Question 5 & 6 ##
def word_sizes(phrase)
  word_count = Hash.new(0)
  phrase.split.each do |word|
    word.gsub!(/\W+/,"")
    word_count[word.length] +=1
  end
  word_count.sort.to_h
end

## Question 7 ##
NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten
                  eleven twelve thirteen fourteen fifteen sixteen seventeen
                  eighteen nineteen)

def alphabetic_number_sort(num_array)
  num_array.sort_by { |num| NUMBER_WORDS[num] }
end
binding.pry

## Question 8 ##
def crunch(str)
  if str.empty?
    str
  else
    crunched = str[0]
    str.split('').each_with_index do |letter, index|
      crunched << letter if index != 0 && str[index - 1] != letter
    end
    crunched
  end
end

## Question 9 ##
def buffer(length, marker)
  buffer_string = ""
  length.times { buffer_string << marker }
  buffer_string
end

def print_in_box(msg)
  puts <<-HEREDOC
+-#{buffer(msg.length, "-")}-+
| #{buffer(msg.length, " ")} |
| #{msg} |
| #{buffer(msg.length, " ")} |
+-#{buffer(msg.length, "-")}-+
  HEREDOC
end

puts "Hi"
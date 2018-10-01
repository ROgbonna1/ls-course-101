## Question 1 ##
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_hash = {}
flintstones.each_with_index do |name, index|
  flint_hash[name] = index
end

p flint_hash

## Question 2 ##
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.sum

## Question 3 ##
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.reject! {|name, age| age > 100 }
p ages

## Question 4 ##
p ages.values.min

## Question 5 ##
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index {|word| word[0..1] == "Be"}

## Question 6 ##
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|word| word[0,3] }
p flintstones

## Question 7 ##
statement = "The Flintstones Rock"
char_hash = {}
statement.downcase.chars.each do |letter|
  char_hash[letter] = 1 unless char_hash.include? letter
  char_hash[letter] +=1 if char_hash.include? letter
end
p char_hash

## Question 9 ##
words = "the flintstones rock"

def titleize(phrase)
  phrase.split.map do |word|
    word.capitalize
  end.join(' ')
end

puts titleize(words)

## Question 10 ##
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |monster, demo_hash|
  if demo_hash["age"] > 64
    demo_hash["age_group"] = "senior"
  elsif demo_hash["age"] < 18
    demo_hash["age_group"] = "kid"
  else
    demo_hash["age_group"] = "adult"
  end
end

p munsters
## Question 1 ##
arr = ['10', '11', '9', '7', '8']
p arr.sort { |a, b| b.to_i <=> a.to_i }

## Question 2 ##
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p(books.sort_by { |book| book[:published] })

## Question 3 ##
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

## Question 4 ##
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

## Question 5 ##
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each do |monster, demo_hash|
  total_male_age += demo_hash["age"] if demo_hash["gender"] == "male"
end
p total_male_age

## Question 6 ##
munsters.each do |monster, demo_hash|
  puts "#{monster} is a #{demo_hash["age"]}-year old #{demo_hash["gender"]}."
end

## Question 8 ##
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each_value do |word_array|
  word_array.each do |word|
    word.delete!("^aeiou")
    p word
  end
end

## Question 9 ##
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map! do |sub_array|
  sub_array.sort.reverse
end
p arr

## Question 10 ##
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr_new = arr.map do |hash|
  hash.each { |key, num| hash[key] += 1 }
end
p arr_new

## Question 11 ##
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr_new = arr.map do |num_array|
  num_array.reject { |num| num % 3 != 0 }
end
p arr_new

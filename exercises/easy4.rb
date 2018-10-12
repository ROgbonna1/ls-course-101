## Question 1 ##
def short_long_short(str1, str2)
  str1.length < str2.length ? str1 + str2 + str1 : str2 + str1 + str2
end

## Question 2 ##
def century(year)
  return "1st" if year <= 100
  year -= 1 if year % 10 == 0
  century = (year.to_s[0...-2].to_i + 1).to_s
  return century + "st" if century[-1] == "1" unless century[-2..-1] == "11"
  return century + "nd" if century[-1] == "2" unless century[-2..-1] == "12"
  return century + "rd" if century[-1] == "3" unless century[-2..-1] == "13"
  century + "th"
end

## Question 3 ##
def leap_year?(year)
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
end

## Question 4 ##
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
  end
end

## Question 5 ##
def multisum(num)
  sum = 0
  for i in 0..num
    sum += i if i % 3 == 0 || i % 5 == 0
  end
  sum
end

## Question 6 ##
def running_total(nums)
  totals = []
  return totals if nums.empty?
  nums.each_with_index do |num, index|
    totals << nums[0..index].reduce(&:+)
  end
  totals
end

## Question 7 ##
DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
          '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
          
def string_to_integer(str)
  str.chars.each_with_index.map do |digi_str, index| 
   ( DIGITS[digi_str] * (10 ** (str.length - index - 1)) )
 end.sum
end

## Question 8 ##
def string_to_signed_int(str)
  case str[0]
  when '-' then string_to_integer(str[1..-1]) * -1
  when '+' then string_to_integer(str[1..-1])
  else          string_to_integer(str)
  end
end

## Question 9 ##
def integer_to_powers_of_ten(int)
  num_array = []
  i = 0
  loop do
    break if int % 10 ** i == int
    num_array << int % 10 ** (i + 1) - int % 10 ** i
    i += 1
  end
  num_array.reverse
end

def array_of_digits(int)
  integer_to_powers_of_ten(int).each_with_index.map do |power, index|
    power / (10 ** (integer_to_powers_of_ten(int).length - (index + 1)))
  end
end

def integer_to_string(int)
  return "0" if int == 0
  array_of_digits(int).map { |x| DIGITS.key(x) }.join
end

## Question 10 ##
def signed_integer_to_string(num)
  case num <=> 0
  when -1 then "-#{integer_to_string(-num)}"
  when 1 then "+#{integer_to_string(num)}"
  else        integer_to_string(num)
  end
end
  
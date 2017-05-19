##
# This program will take a base10 number from the command line, convert it to a
# base2 and find the longest succession of digit ones, and print the base10
# version that base2 succession of digit ones represents to the command line.
#
# This solves the problem found at https://github.com/JadziaHax/hackerrank-solutions

##
# This method takes a string expression of a base2 number. We specifiy two
# variables that equal integer 0 for use in an iteration. One is an accumulator,
# and the other will serve as an exponentiator.
#
# For a number of iterations equal to the length of our string, We
#
# 1. Perform our exponentiation
# 2. Add the product of that exponentiation to our accumulator.
# 3. Increment our exponentiator by one.
#
# Once we are finished iterating, the accumulator will equal the base10 version
# of our base2 number, and we return it.
#
def build_base10(base2_number_string)
  exp = 0
  total = 0

  base2_number_string.length.times do
    total += (2**exp)

    if exp == 0
      exp == 1
    else
      exp += exp
    end
  end

  total
end

##
# This method takes a string version of a base2 number and finds the longest
# succession of digit ones that occurs within it. It then calls a method that
# will find the base 10 number that seccession of digit ones would be.
#
def find_longest_successive_ones(string_number)
  count = 0
  highest = 0

  string_number.split('').each do |num|
    num = num.to_i
    if num == 0
      count = 0
    elsif num == 1
      count += 1
      highest = count if count > highest
    end
  end

  result = highest * "1"

  build_base10(result)
end

def build_base2(base10_number, expression='')

  div_by_2 = base10_number.divmod(2)

  if div_by_2 == [0,1]
    expression += div_by_2[1].to_s
    find_longest_successive_ones(expression)
  else
    expression += div_by_2[1].to_s
    build_base2(div_by_2[0], expression)
  end
end

puts build_base2(gets.strip.to_i)

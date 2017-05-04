
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

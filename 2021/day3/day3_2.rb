def read_report
  file = File.open('inputs/day3')
  diagnostic_report = file.readlines.map(&:chomp)
  file.close
  diagnostic_report
end

def get_bits(array)
  bits = []
  array.each { |elem| bits << elem.split('') }
  bits
end

def most_common_bit_by_position(array, position)
  result = 0
  array.each { |num| num[position] == '1' ? result += 1 : result -= 1 }
  result >= 0 ? '1' : '0'
end

def least_common_bit_by_position(array, position)
  result = 0
  array.each { |num| num[position] == '1' ? result += 1 : result -= 1 }
  result < 0 ? '1' : '0'
end

def get_rows_by_value_at_bit_index(array, bit_index, value)
  new = []
  array.each { |elem| new << elem if elem[bit_index] == value }
  new
end

def oxygen_gen_rating(array, index)
  return array[0] if array.length == 1

  most_common_bit = most_common_bit_by_position(array, index)
  new_array = get_rows_by_value_at_bit_index(array, index, most_common_bit)
  oxygen_gen_rating(new_array, index + 1)
end

def co2_scrub_rating(array, index)
  return array[0] if array.length == 1

  most_common_bit = least_common_bit_by_position(array, index)
  new_array = get_rows_by_value_at_bit_index(array, index, most_common_bit)
  co2_scrub_rating(new_array, index + 1)
end

diagnostic_report = read_report
oxygen_generator_rating = oxygen_gen_rating(diagnostic_report, 0).to_i(2)
co2_scrubber_rating = co2_scrub_rating(diagnostic_report, 0).to_i(2)

puts "Oxygen generator rating: #{oxygen_generator_rating}"
puts "CO2 scrubber rating: #{co2_scrubber_rating}"

life_support_rating = oxygen_generator_rating * co2_scrubber_rating
puts "Life support rating: #{life_support_rating}"
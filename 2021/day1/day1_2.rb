file = File.open('inputs/day1')
depths = File.readlines(file, chomp: true).map(&:to_i)
file.close
number_of_depths = depths.length

increases = 0
depths.each_with_index do |depth, i|
next if number_of_depths <= i + 3
current_three_measurement = depth + depths[i + 1] + depths[i + 2]
next_three_measurement = depths[i + 1] + depths[i + 2] + depths[i + 3]
puts current_three_measurement
increases += 1 if current_three_measurement < next_three_measurement
end

puts "There are #{increases} increases."

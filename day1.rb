file = File.open('inputs/day1')
depths = File.readlines(file, chomp: true).map(&:to_i)
file.close

increases = 0
depths.each_with_index do |depth, i|
next if i.zero?
increases += 1 if depth > depths[i - 1]
end

puts "There are #{increases} increases."
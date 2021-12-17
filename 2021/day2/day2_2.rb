file = File.open('inputs/day2')
movements = File.readlines(file, chomp: true)
file.close

depth = 0
position = 0
aim = 0

movements.each do |move|
  movement = move.split
  action = movement[0]
  units = movement[1].to_i
  case action
  when "forward"
    position += units
    depth += aim * units
  when "down"
    aim += units
  when "up"
    aim -= units
  else
    "You gave me #{action} -- I have no idea what to do with that."
  end
end

puts "Depth: #{depth}"
puts "Position: #{position}"

puts "Depth * Position = #{depth * position}"
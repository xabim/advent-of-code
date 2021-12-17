file = File.open('inputs/day2')
movements = File.readlines(file, chomp: true)
file.close

depth = 0
position = 0

movements.each do |move|
  movement = move.split
  p movement
  case movement[0]
  when "forward"
    position += movement[1].to_i
  when "down"
    depth += movement[1].to_i
  when "up"
    depth -= movement[1].to_i
  else
    "You gave me #{movement[0]} -- I have no idea what to do with that."
  end
end

puts "Depth: #{depth}"
puts "Position: #{position}"

puts "Depth * Position = #{depth * position}"
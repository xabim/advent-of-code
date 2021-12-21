require_relative './diagram.rb'

class HydrothermalVenture

  def initialize(input)
    @list = read_input(input)
    @diagram = Diagram.new(1000, 1000)
  end

  def part1()
    mark_lines(@list)
    @diagram.count_overlaps
  end

  def part2()
    mark_diagonal_lines(@list)
    @diagram.count_overlaps
  end

  attr_reader :diagram

  private

  def read_input(path)
    file = File.open(path)
    input = file.readlines.map(&:chomp)
    file.close
    input
  end

  def mark_lines(list)
    list.each do |line|
      first = line.split(" -> ")[0].split(',')
      second = line.split(" -> ")[1].split(',')

      first = Coordinate.new(first[0].to_i, first[1].to_i)
      second = Coordinate.new(second[0].to_i, second[1].to_i)
      @diagram.mark_lines(first, second)
    end
  end

  def mark_diagonal_lines(list)
    list.each do |line|
      first = line.split(" -> ")[0].split(',')
      second = line.split(" -> ")[1].split(',')

      first = Coordinate.new(first[0].to_i, first[1].to_i)
      second = Coordinate.new(second[0].to_i, second[1].to_i)
      @diagram.mark_diagonal_lines(first, second)
    end
  end
end

hydrothermalventure = HydrothermalVenture.new('test5')
puts "Test - Part1: #{hydrothermalventure.part1}"
puts "Test - Part2: #{hydrothermalventure.part2}"

hydrothermalventure = HydrothermalVenture.new('day5')
puts "Day5 - Part1: #{hydrothermalventure.part1}"
puts "Day5 - Part2: #{hydrothermalventure.part2}"

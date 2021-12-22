class Crabs
  def initialize(path)
    file = File.open(path)
    @crabs = file.readlines.map(&:chomp)[0].split(',').map(&:to_i)
    file.close
  end

  def calculate_total_fuel_spent
    @fuels_spent = []
    (@crabs.min..@crabs.max).each { |crab| calculate_fuel_spent(crab) }
    @fuels_spent.min
  end

  def calculate_total_fuel_spent_incremental
    @fuels_spent = []
    (@crabs.min..@crabs.max).each { |crab| calculate_fuel_spent_incremental(crab) }
    @fuels_spent.min
  end

  private

  def calculate_fuel_spent(crab)
    fuel = 0
    @crabs.each do |input|
      fuel += (input - crab).abs
    end
    @fuels_spent << fuel
  end

  def calculate_fuel_spent_incremental(crab)
    fuel = 0
    @crabs.each do |input|
      fuel += ((input - crab).abs * ((input - crab).abs + 1))/2
    end
    @fuels_spent << fuel
  end
end

crab = Crabs.new('test7')
puts "Test - Part1: #{crab.calculate_total_fuel_spent}"
crab = Crabs.new('test7')
puts "Test - Part2: #{crab.calculate_total_fuel_spent_incremental}"

crab = Crabs.new('day7')
puts "Day6 - Part1: #{crab.calculate_total_fuel_spent}"
crab = Crabs.new('day7')
puts "Day6 - Part2: #{crab.calculate_total_fuel_spent_incremental}"

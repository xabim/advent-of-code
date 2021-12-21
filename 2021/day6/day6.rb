class LanternFish
  def initialize(path)
    file = File.open(path)
    @data = file.readlines.map(&:chomp)[0]
    file.close
    normalise_data
  end

  def simulate_days(n)
    n.times do
      tmp = @map[0]

      (0..7).each { |i| @map[i] = @map[i + 1] }

      @map[6] += tmp
      @map[8] = tmp
    end
    @map.values.sum
  end

  private

  def normalise_data
    @data = @data.split(',').map(&:to_i)
    @map = Hash.new(0)
    @data.each { |d| @map[d] += 1 }
  end
end

lanternfish = LanternFish.new('test6')
puts "Test - Part1: #{lanternfish.simulate_days(80)}"
lanternfish = LanternFish.new('test6')
puts "Test - Part2: #{lanternfish.simulate_days(256)}"

lanternfish = LanternFish.new('day6')
puts "Day6 - Part1: #{lanternfish.simulate_days(80)}"
lanternfish = LanternFish.new('day6')
puts "Day6 - Part2: #{lanternfish.simulate_days(256)}"

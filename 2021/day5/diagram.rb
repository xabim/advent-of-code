require 'matrix'

class Diagram

  def initialize(length, height)
    @matrix = Matrix.zero(length, height)
  end

  attr_reader :matrix

  def count_overlaps
    matrix.filter {|x| x > 1}.size
  end

  def display
    @matrix.transpose.to_a.each {|r| puts r.inspect}
  end

  def mark_lines(coordinate1, coordinate2)
    return if coordinate1.x != coordinate2.x and coordinate1.y != coordinate2.y

    xs = coordinate1.x > coordinate2.x ? coordinate2.x.upto(coordinate1.x).to_a : coordinate1.x.upto(coordinate2.x).to_a
    ys = coordinate1.y > coordinate2.y ? coordinate2.y.upto(coordinate1.y).to_a : coordinate1.y.upto(coordinate2.y).to_a

    if no_movement_in_axis(xs)
      xs = Array.new(ys.length, coordinate1.x)
      0.upto(ys.length - 1) { |i| @matrix[xs[i],ys[i]] += 1}
    else
      ys = Array.new(xs.length, coordinate1.y)
      0.upto(xs.length - 1) { |i| @matrix[xs[i],ys[i]] += 1}
    end
  end

  def mark_diagonal_lines(coordinate1, coordinate2)
    return if (coordinate1.x - coordinate2.x).abs != (coordinate1.y - coordinate2.y).abs

    xs = coordinate1.x > coordinate2.x ? coordinate1.x.downto(coordinate2.x).to_a : coordinate1.x.upto(coordinate2.x).to_a
    ys = coordinate1.y > coordinate2.y ? coordinate1.y.downto(coordinate2.y).to_a : coordinate1.y.upto(coordinate2.y).to_a

    0.upto(xs.length - 1) { |i| @matrix[xs[i],ys[i]] += 1 }
  end

  private

  def no_movement_in_axis(axis)
    axis.length == 1 ? true : false
  end

end

class Coordinate
  def initialize(x, y)
      @x = x
      @y = y
  end

  attr_accessor :x, :y
end

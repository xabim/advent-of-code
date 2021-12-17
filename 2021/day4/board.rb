class Board

  def initialize(numbers)
    @numbers = numbers
  end

  attr_reader :numbers

  # Change the number to nil makes a mark, as we don't need them
  def mark(number)
    @numbers.each do |values|
      values.map! do |value|
        value == number ? nil : value
      end
    end
  end

  def fulfilled?
    row_fulfilled? || column_fulfilled?
  end

  def sum
    @numbers.flatten.compact.reduce(0) { |pre, cur| pre + cur }
  end

  private

  # If a row is marked return true.
  def row_fulfilled?
    @numbers.any? { |row| row.compact.empty? }
  end

  # If a column is marked return true.
  def column_fulfilled?
    @numbers.transpose.any? { |row| row.compact.empty? }
  end
end
class Board

  def initialize(numbers)
    @numbers = numbers
  end

  attr_reader :numbers

  # Change the number to nil makes a mark, as we don't need them
  def mark_number(mark)
    @numbers.each do |values|
      values.map! do |value|
        if value == mark
          nil
        else
          value
        end
      end
    end
  end

  def fulfilled?
    row_fulfilled? || column_fulfilled?
  end

  def sum
    @numbers.flatten.compact.reduce(0) { |pre, cur| pre + cur }
  end

  def prints
    numbers.each do |values|
      values.each do |value|
        if value.nil?
          print 'X'.ljust(4)
        else
          print value.to_s.ljust(4)
        end
      end
      puts
    end
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
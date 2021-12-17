require './Board'

class Game

  def initialize(input)
    file = read_input(input)
    @drawn_numbers = get_drawn_numbers(file)
    @boards = []
    create_boards_from_file(file)
  end

  attr_reader :drawn_numbers, :boards

  def run
    @drawn_numbers.each do |number|
      @boards.each do |board|
        board.mark(number)
        return number * board.sum if board.fulfilled?
      end
    end
    nil
  end

  def let_the_giant_squid_win
    last_score = 0
    @drawn_numbers.each do |number|
      @boards.each do |board|
        board.mark(number)
        last_score = number * board.sum if board.fulfilled?
      end
      @boards.each_with_index { |board, index| @boards.delete_at(index) if board.fulfilled? }
    end
    last_score
  end

  private

  def read_input(path)
    file = File.open(path)
    input = file.readlines.map(&:chomp)
    file.close
    input
  end

  def get_drawn_numbers(input)
    input[0].split(',').map(&:to_i)
  end

  def create_boards_from_file(input)
    next_board = []
    input.each_with_index do |row, i|
      next if i < 2

      if i % 6 == 1
        @boards << Board.new(next_board)
        next_board = []
        next
      end
      next_board << row.split(' ').map(&:to_i)
    end
  end
end

game = Game.new('test4')
puts "Test: #{game.run}"

game = Game.new('day4')
puts "Task1: #{game.run}"

game = Game.new('day4')
puts "Task2: #{game.let_the_giant_squid_win}"
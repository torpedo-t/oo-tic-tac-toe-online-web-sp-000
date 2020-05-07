require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
   user_input.to_i - 1
  end

  def move(index, current_player)
   @board[index] = current_player
  end

  def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
  end

  def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
  if valid_move?(index)
   move(index, current_player)
   display_board
  else
   turn
  end
  end

  def turn_count
   counter = 0
   @board.each do |position|
  if position == ("X") || position == ("O")
   counter += 1
  end
  end
   counter
  end #returns the number of turns that have been played

  def current_player
  if turn_count % 2 == 0
   return "X"
  else
  return "O"
  end
  end

  def won?
    WIN_COMBINATIONS.detect do |index|
      @board[index[0]] == @board[index[1]] &&
      @board[index[1]] == @board[index[2]] &&
      position_taken?(index[0])
  end
  end

  def full?
#binding.pry
   @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
   full? && !won?
  end

  def over?
   won? || draw?
  end

  def winner
  if won?
   won_combo = won?
  return @board[won_combo[0]]
  end
  end

  def play
    #binding.pry
   until over?
   turn
  end
  if won?
    #binding.pry
   puts "Congratulations #{winner}!"
  else
   puts "Cat\'s Game!"
  end
  end
 end

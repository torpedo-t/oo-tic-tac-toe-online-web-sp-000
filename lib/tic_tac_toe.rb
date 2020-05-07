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
   @board.full? && !@board.won?
  end

  def over?
   @board.won? || @board.draw?
  end

  def winner
  if @board.won?
   winning_combo = @board.won?
  return @board[winning_combo[0]]
  end
  end

  def play
   until @board.over?
   @board.turn
  end
  if @board.won?
   puts "Congratulations #{winner(board)}!"
  else
   puts "Cat\'s Game!"
  end
end
end

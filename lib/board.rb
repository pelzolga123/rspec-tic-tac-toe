# frozen_string_literal: true

# Board class
class Board
  INIT_MARKER = ' '

  def initialize(board = {})
    @board = board
    @board ||= (1..9).each_with_object({}) { |n, b| b[n] = INIT_MARKER }
  end

  def display
    "
           |       |
       #{@board[1]}   |   #{@board[2]}   |   #{@board[3]}
           |       |
    -----------------------
           |       |
       #{@board[4]}   |   #{@board[5]}   |   #{@board[6]}
           |       |
    -----------------------
           |       |
       #{@board[7]}   |   #{@board[8]}   |   #{@board[9]}
           |       |
    "
  end

  def place_marker(position, marker)
    @board[position] = marker
  end

  def valid_selection?(position)
    @board[position] == INIT_MARKER && (1..9).include?(selection)
  end

  def lines
    markers = @board.values
    [
      markers.each_slice(3).to_a,             # rows
      markers.each_slice(3).to_a.transpose,   # columns
      [[markers[0], markers[4], markers[8]],  # diagonal 1
       [markers[2], markers[4], markers[6]]]  # diagonal 2
    ].flatten(1)
  end

  def winner?
    lines.any? { |line| line.all?('X') || line.all?('O') }
  end

  def draw?
    !winner? && @board.values.none?(INIT_MARKER)
  end
end

# Frozen_string_literal: true

# Class describing the connect four game and methods for playing

require_relative 'player'

class ConnectFour

  def initialize
    @board = Array.new(6) { Array.new(7, '_') }
  end

  def display
    display = <<-BOARD

        1   2   3   4   5   6   7
      | #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} | #{@board[0][3]} | #{@board[0][4]} | #{@board[0][5]} | #{@board[0][6]} |
      | #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} | #{@board[1][3]} | #{@board[1][4]} | #{@board[1][5]} | #{@board[1][6]} |
      | #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} | #{@board[2][3]} | #{@board[2][4]} | #{@board[2][5]} | #{@board[2][6]} |
      | #{@board[3][0]} | #{@board[3][1]} | #{@board[3][2]} | #{@board[3][3]} | #{@board[3][4]} | #{@board[3][5]} | #{@board[3][6]} |
      | #{@board[4][0]} | #{@board[4][1]} | #{@board[4][2]} | #{@board[4][3]} | #{@board[4][4]} | #{@board[4][5]} | #{@board[4][6]} |
      | #{@board[5][0]} | #{@board[5][1]} | #{@board[5][2]} | #{@board[5][3]} | #{@board[5][4]} | #{@board[5][5]} | #{@board[5][6]} |

    BOARD
    puts display
  end

  def game_over?(token)
    return true if game_win?(token) || game_draw?
  end

  def game_win?(token)
    return true if winning_conditions(token)
  end

  def winning_conditions(token)
    @board[5][0] == token && @board[5][1] == token && @board[5][2] == token && @board[5][3] == token ||
    @board[5][1] == token && @board[5][2] == token && @board[5][3] == token && @board[5][4] == token ||
    @board[5][2] == token && @board[5][3] == token && @board[5][4] == token && @board[5][5] == token ||
    @board[5][3] == token && @board[5][4] == token && @board[5][5] == token && @board[5][6] == token ||
    @board[4][0] == token && @board[4][1] == token && @board[4][2] == token && @board[4][3] == token ||
    @board[4][1] == token && @board[4][2] == token && @board[4][3] == token && @board[4][4] == token ||
    @board[4][2] == token && @board[4][3] == token && @board[4][4] == token && @board[4][5] == token ||
    @board[4][3] == token && @board[4][4] == token && @board[4][5] == token && @board[4][6] == token ||
    @board[3][0] == token && @board[3][1] == token && @board[3][2] == token && @board[3][3] == token ||
    @board[3][1] == token && @board[3][2] == token && @board[3][3] == token && @board[3][4] == token ||
    @board[3][2] == token && @board[3][3] == token && @board[3][4] == token && @board[3][5] == token ||
    @board[3][3] == token && @board[3][4] == token && @board[3][5] == token && @board[3][6] == token ||
    @board[2][0] == token && @board[2][1] == token && @board[2][2] == token && @board[2][3] == token ||
    @board[2][1] == token && @board[2][2] == token && @board[2][3] == token && @board[2][4] == token ||
    @board[2][2] == token && @board[2][3] == token && @board[2][4] == token && @board[2][5] == token ||
    @board[2][3] == token && @board[2][4] == token && @board[2][5] == token && @board[2][6] == token ||
    @board[1][0] == token && @board[1][1] == token && @board[1][2] == token && @board[1][3] == token ||
    @board[1][1] == token && @board[1][2] == token && @board[1][3] == token && @board[1][4] == token ||
    @board[1][2] == token && @board[1][3] == token && @board[1][4] == token && @board[1][5] == token ||
    @board[1][3] == token && @board[1][4] == token && @board[1][5] == token && @board[1][6] == token ||
    @board[0][0] == token && @board[0][1] == token && @board[0][2] == token && @board[0][3] == token ||
    @board[0][1] == token && @board[0][2] == token && @board[0][3] == token && @board[0][4] == token ||
    @board[0][2] == token && @board[0][3] == token && @board[0][4] == token && @board[0][5] == token ||
    @board[0][3] == token && @board[0][4] == token && @board[0][5] == token && @board[0][6] == token ||
    @board[5][0] == token && @board[4][0] == token && @board[3][0] == token && @board[2][0] == token ||
    @board[4][0] == token && @board[3][0] == token && @board[2][0] == token && @board[1][0] == token ||
    @board[3][0] == token && @board[2][0] == token && @board[1][0] == token && @board[0][0] == token ||
    @board[5][1] == token && @board[4][1] == token && @board[3][1] == token && @board[2][1] == token ||
    @board[4][1] == token && @board[3][1] == token && @board[2][1] == token && @board[1][1] == token ||
    @board[3][1] == token && @board[2][1] == token && @board[1][1] == token && @board[0][1] == token ||
    @board[5][2] == token && @board[4][2] == token && @board[3][2] == token && @board[2][2] == token ||
    @board[4][2] == token && @board[3][2] == token && @board[2][2] == token && @board[1][2] == token ||
    @board[3][2] == token && @board[2][2] == token && @board[1][2] == token && @board[0][2] == token ||
    @board[5][3] == token && @board[4][3] == token && @board[3][3] == token && @board[2][3] == token ||
    @board[4][3] == token && @board[3][3] == token && @board[2][3] == token && @board[1][3] == token ||
    @board[3][3] == token && @board[2][3] == token && @board[1][3] == token && @board[0][3] == token ||
    @board[5][4] == token && @board[4][4] == token && @board[3][4] == token && @board[2][4] == token ||
    @board[4][4] == token && @board[3][4] == token && @board[2][4] == token && @board[1][4] == token ||
    @board[3][4] == token && @board[2][4] == token && @board[1][4] == token && @board[0][4] == token ||
    @board[5][5] == token && @board[4][5] == token && @board[3][5] == token && @board[2][5] == token ||
    @board[4][5] == token && @board[3][5] == token && @board[2][5] == token && @board[1][5] == token ||
    @board[3][5] == token && @board[2][5] == token && @board[1][5] == token && @board[0][5] == token ||
    @board[5][6] == token && @board[4][6] == token && @board[3][6] == token && @board[2][6] == token ||
    @board[4][6] == token && @board[3][6] == token && @board[2][6] == token && @board[1][6] == token ||
    @board[3][6] == token && @board[2][6] == token && @board[1][6] == token && @board[0][6] == token ||
    @board[5][0] == token && @board[4][1] == token && @board[3][2] == token && @board[2][3] == token ||
    @board[5][1] == token && @board[4][2] == token && @board[3][3] == token && @board[2][4] == token ||
    @board[5][2] == token && @board[4][3] == token && @board[3][4] == token && @board[2][5] == token ||
    @board[5][3] == token && @board[4][4] == token && @board[3][5] == token && @board[2][6] == token ||
    @board[4][0] == token && @board[3][1] == token && @board[2][2] == token && @board[1][3] == token ||
    @board[4][1] == token && @board[3][2] == token && @board[2][3] == token && @board[1][4] == token ||
    @board[4][2] == token && @board[3][3] == token && @board[2][4] == token && @board[1][5] == token ||
    @board[4][3] == token && @board[3][4] == token && @board[2][5] == token && @board[1][6] == token ||
    @board[3][0] == token && @board[2][1] == token && @board[1][2] == token && @board[0][3] == token ||
    @board[3][1] == token && @board[2][2] == token && @board[1][3] == token && @board[0][4] == token ||
    @board[3][2] == token && @board[2][3] == token && @board[1][4] == token && @board[0][5] == token ||
    @board[3][3] == token && @board[2][4] == token && @board[1][5] == token && @board[0][6] == token ||
    @board[5][6] == token && @board[4][5] == token && @board[3][4] == token && @board[2][3] == token ||
    @board[5][5] == token && @board[4][4] == token && @board[3][3] == token && @board[2][2] == token ||
    @board[5][4] == token && @board[4][3] == token && @board[3][2] == token && @board[2][1] == token ||
    @board[5][3] == token && @board[4][2] == token && @board[3][1] == token && @board[2][0] == token ||
    @board[4][6] == token && @board[3][5] == token && @board[2][4] == token && @board[1][3] == token ||
    @board[4][5] == token && @board[3][4] == token && @board[2][3] == token && @board[1][2] == token ||
    @board[4][4] == token && @board[3][3] == token && @board[2][2] == token && @board[1][1] == token ||
    @board[4][3] == token && @board[3][2] == token && @board[2][1] == token && @board[1][0] == token ||
    @board[3][6] == token && @board[2][5] == token && @board[1][4] == token && @board[0][3] == token ||
    @board[3][5] == token && @board[2][4] == token && @board[1][3] == token && @board[0][2] == token ||
    @board[3][4] == token && @board[2][3] == token && @board[1][2] == token && @board[0][1] == token ||
    @board[3][3] == token && @board[2][2] == token && @board[1][1] == token && @board[0][0] == token
  end

  def game_draw?
    return true unless @board.flatten.include?('_')
  end

  def place_token(column_number, token)
    # If 1 chosen place token in lowest unfilled slot i.e. @board[5][0]
    # place at @board[1][column_number - 1]

    # If @board[1][0] filled?
    #   place token @board[0][0]
    # Elseif @board[2][0] filled?
    #   place token @board[1][0]
    # Elseif @board[3][0] filled?
    #   place token @board[2][0]
    # Elseif @board[4][0] filled?
    #   place token @board[3][0]
    # Elseif @board[5][0] filled?
    #   place token @board[4][0]
    # Else
    #   place token @board[5][0]
  end
end

# Frozen_string_literal: true

require_relative 'player'

# Class describing the connect four game and methods for playing
class ConnectFour
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, '_') }
    @player_number_one = nil
    @player_number_two = nil
  end

  # rubocop:disable Metrics/AbcSize
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
  # rubocop:enable Metrics/AbcSize

  def game_over?
    return true if game_win?(@player_number_one.token) || game_win?(@player_number_two.token) || game_draw?
  end

  def game_win?(token)
    return true if winning_conditions(token)
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def game_draw?
    return true unless @board.flatten.include?('_')
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def place_token(column_number, token)
    if filled?(@board[0][column_number - 1])
      'Error, please choose a column that is not full already.'
    elsif filled?(@board[1][column_number - 1])
      @board[0][column_number - 1] = token
    elsif filled?(@board[2][column_number - 1])
      @board[1][column_number - 1] = token
    elsif filled?(@board[3][column_number - 1])
      @board[2][column_number - 1] = token
    elsif filled?(@board[4][column_number - 1])
      @board[3][column_number - 1] = token
    elsif filled?(@board[5][column_number - 1])
      @board[4][column_number - 1] = token
    else
      @board[5][column_number - 1] = token
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def filled?(co_ord)
    return true unless co_ord == '_'
  end

  def player_column_choose(player)
    puts "#{player.name}, please pick a column to place your token in: "
    column_number = gets.chomp
    until validate_column?(column_number)
      puts 'Please choose a number from 1 - 7.'
      column_number = gets.chomp
    end
    place_token(column_number.to_i, player.token)
  end

  def validate_column?(input)
    return true if input.match?(/^[1-7]$/)
  end

  def play_game(with_intro: true)
    intro if with_intro
    create_players if @player_number_one.nil?
    display
    game_loop
    declare_winner
    play_again
  end

  def create_players
    @player_number_one = Player.new(1)
    @player_number_one.ask_name
    @player_number_one.ask_token
    @player_number_two = Player.new(2)
    @player_number_two.ask_name
    @player_number_two.ask_token
  end

  def player_turn(player)
    player_column_choose(player)
    display
    player.add_score_point if game_win?(player.token)
  end

  def game_loop
    loop do
      break if game_over?

      player_turn(@player_number_one)
      break if game_over?

      player_turn(@player_number_two)
    end
  end

  def declare_winner
    winner = if @player_number_one.score > @player_number_two.score
               @player_number_one.name
             else
               @player_number_two.name
             end
    puts "The winner is #{winner}"
  end

  def overall_winner
    winner = if @player_number_one.rounds_won > @player_number_two.rounds_won
               @player_number_one.name
             elsif @player_number_one.rounds_won < @player_number_two.rounds_won
               @player_number_two.name
             else
               return puts "It's a draw!"
             end
    puts "The overall winner is #{winner}"
  end

  def play_again
    puts "Would you like to play another round? Yes ('Y') or No ('N')?"
    choice = gets.chomp.upcase
    until validate_play_again?(choice)
      puts "Please choose either 'Y' or 'N'."
      choice = gets.chomp.upcase
    end
    choice == 'Y' ? next_round : exit_game
  end

  def validate_play_again?(input)
    return true if input.match?(/^[YN]$/)
  end

  def next_round
    @board = Array.new(6) { Array.new(7, '_') }
    @player_number_one.reset_score
    @player_number_two.reset_score
    play_game(with_intro: false)
  end

  def exit_game
    overall_winner
    puts 'Thank you for playing!'
    exit
  end

  def intro
    puts <<~'INTRO'
      /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\
      \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/

        Connect Four (also known as Four Up, Plot Four, Find Four, Captain's
        Mistress, Four in a Row, Drop Four, and Gravitrips in the Soviet Union) is
        a two-player connection board game, in which the players choose a token,
        usually a colour, and then take turns dropping those tokens into a
        seven-column, six-row vertically suspended grid.

        The pieces fall straight down, occupying the lowest available space
        within the column. The objective of the game is to be the first to form a
        horizontal, vertical, or diagonal line of four of one's own discs.

      /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\
      \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
    INTRO
  end
end

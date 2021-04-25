# Frozen_string_literal: true

# Class defining player class and methods for interacting with ConnectFour game class
class Player
  attr_reader :name, :player_number, :token, :score, :rounds_won

  def initialize(player_number)
    @player_number = player_number
    @name = ask_name
    @token = ask_token
    @score = 0
    @rounds_won = 0
  end

  def ask_name
    puts "Player #{@player_number}, please enter your name: "
    @name = gets.chomp.capitalize
  end

  def ask_token
    puts 'Now choose a token to play with by choosing a number '
    puts '1: X'
    puts '2: O'
    choice = gets.chomp
    until validate?(choice)
      puts 'Please choose either 1 or 2'
      choice = gets.chomp
    end
    @token = choice == '1' ? 'X' : 'O'
  end

  def validate?(input)
    return true if input.match?(/^[12]$/)
  end

  def add_score_point
    @score += 1
    @rounds_won += 1
  end

  def reset_score
    @score = 0
  end
end

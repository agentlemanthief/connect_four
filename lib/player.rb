# Frozen_string_literal: true

# Class defining player class and methods for interacting with ConnectFour game class
class Player
  attr_reader :name, :player_number, :token, :score, :rounds_won

  @@used_tokens = []

  def initialize(player_number = 1)
    @player_number = player_number
    @name = nil
    @token = nil
    @score = 0
    @rounds_won = 0
  end

  def ask_name
    puts "Player #{@player_number}, please enter your name: "
    @name = gets.chomp.capitalize
  end

  def ask_token
    puts 'Now choose a token to play with by choosing a number '
    puts "1: \u2620"
    puts "2: \u262E"
    choice = gets.chomp
    until validate?(choice)
      puts "Please choose either 1 or 2 and ensure your choice hasn't already been chosen"
      choice = gets.chomp
    end
    @@used_tokens.push(choice)
    @token = choice == '1' ? "\u2620" : "\u262E"
  end

  def validate?(input)
    return true if input.match?(/^[12]$/) && !@@used_tokens.include?(input)
  end

  def add_score_point
    @score += 1
    @rounds_won += 1
  end

  def reset_score
    @score = 0
  end
end

# Frozen_string_literal: true

# Class defining player class and methods for interacting with ConnectFour game class
class Player
  attr_reader :name, :player_number, :token
  attr_accessor :score

  def initialize(player_number)
    @player_number = player_number
    @name = ask_name
    @token = ask_token
    @score = 0
  end

  def ask_name
    puts "Player #{@player_number}, please enter your name: "
    @name = gets.chomp.capitalize
  end

  def ask_token
    puts "Now choose a token to play with by choosing a number "
    puts "1: X"
    puts "2: O"
    choice = gets.chomp
    until validate?(choice)
      puts 'Please choose either 1 or 2'
      choice = gets.chomp
    end
    choice == '1' ? @token = 'X' : @token = 'O'
  end

  def validate?(input)
    return true if input.match?(/^[12]$/)
  end
end

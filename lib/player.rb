# Frozen_string_literal: true

# Class defining player class and methods for interacting with ConnectFour game class

class Player
  attr_reader :name, :player_number

  def initialize(name, player_number)
    @name = name
    @player_number = player_number
  end
end

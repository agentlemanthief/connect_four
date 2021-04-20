# Frozen_string_literal: true

require_relative '../lib/connect_four'

describe 'ConnectFour' do
  subject(:connect_four) { ConnectFour.new }

  describe '#game_over?' do
    it 'returns true if game is over' do
      token = 'X'
      allow(connect_four).to receive(:game_win?).with(token).and_return(true)
      allow(connect_four).to receive(:game_draw?).and_return(true)
      expect(connect_four.game_over?(token)).to be true
    end
  end

  describe '#draw?' do
    it 'returns true if board is full of tokens and no win state' do
      connect_four.instance_variable_set(:@board, Array.new(6) { Array.new(7, 'X') })
      expect(connect_four.game_draw?).to be true
    end
  end

  describe '#game_win?' do
    it 'returns true if game win conditions met - horizontal' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][0] = token
      board_win_row[5][1] = token
      board_win_row[5][2] = token
      board_win_row[5][3] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'returns true if game win conditions met - vertical' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[2][0] = token
      board_win_row[3][0] = token
      board_win_row[4][0] = token
      board_win_row[5][0] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'returns true if game win conditions met - diagonal' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][0] = token
      board_win_row[4][1] = token
      board_win_row[3][2] = token
      board_win_row[2][3] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'returns true if game win conditions met - anti-diagonal' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][6] = token
      board_win_row[4][5] = token
      board_win_row[3][4] = token
      board_win_row[2][3] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end
  end

  describe '#place_token' do
    it 'updates board in appropriate place when token placed using 1' do

    end
  end
end

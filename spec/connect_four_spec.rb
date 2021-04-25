# Frozen_string_literal: true

require_relative '../lib/connect_four'

describe 'ConnectFour' do
  subject(:connect_four) { ConnectFour.new }

  describe '#game_over?' do
    let(:player_one) { double('Player', token: 'X') }
    let(:player_two) { double('Player', token: 'O') }

    before do
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
    end

    it 'Returns true if game is over by win conditions being met' do
      allow(connect_four).to receive(:game_win?).with(player_one.token).and_return(true)
      expect(connect_four.game_over?).to be(true)
    end

    it 'Returns true if game is over if draw conditions are met' do
      allow(connect_four).to receive(:game_win?).with(player_one.token).and_return(false)
      allow(connect_four).to receive(:game_win?).with(player_two.token).and_return(false)
      allow(connect_four).to receive(:game_draw?).and_return(true)
      expect(connect_four.game_over?).to be(true)
    end
  end

  describe '#game_draw?' do
    it 'Returns true if board is full of tokens and no win state' do
      connect_four.instance_variable_set(:@board, Array.new(6) { Array.new(7, 'X') })
      expect(connect_four.game_draw?).to be(true)
    end

    it 'Returns falsey if board is not full of tokens' do
      board_no_win_no_draw = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_no_win_no_draw[5][0] = token
      board_no_win_no_draw[4][0] = token
      connect_four.instance_variable_set(:@board, board_no_win_no_draw )
      expect(connect_four.game_draw?).to be_falsey
    end
  end

  describe '#game_win?' do
    it 'Returns true if game win conditions met - horizontal' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][0] = token
      board_win_row[5][1] = token
      board_win_row[5][2] = token
      board_win_row[5][3] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'Returns true if game win conditions met - vertical' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[2][0] = token
      board_win_row[3][0] = token
      board_win_row[4][0] = token
      board_win_row[5][0] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'Returns true if game win conditions met - diagonal' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][0] = token
      board_win_row[4][1] = token
      board_win_row[3][2] = token
      board_win_row[2][3] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'Returns true if game win conditions met - anti-diagonal' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][6] = token
      board_win_row[4][5] = token
      board_win_row[3][4] = token
      board_win_row[2][3] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be true
    end

    it 'Returns falsey if game win state not met' do
      board_win_row = Array.new(6) { Array.new(7, '_') }
      token = 'X'
      board_win_row[5][6] = token
      board_win_row[4][5] = token
      board_win_row[3][4] = token
      connect_four.instance_variable_set(:@board, board_win_row)
      expect(connect_four.game_win?(token)).to be_falsey
    end
  end

  describe '#place_token' do
    it 'Places a token into column 1 into the lowest slot' do
      token = 'X'
      connect_four.place_token(1, token)
      bottom_of_first_column = connect_four.board[5][0]
      expect(bottom_of_first_column).to eq(token)
    end

    it 'Places a token into column 1 into the next slot up when the lowest slot is filled' do
      token = 'X'
      2.times { connect_four.place_token(1, token) }
      bottom_of_first_column = connect_four.board[4][0]
      expect(bottom_of_first_column).to eq(token)
    end

    it 'Returns an error message if the user tries to add a token and all the slots are filled' do
      token = 'X'
      error = 'Error, please choose a column that is not full already.'
      6.times { connect_four.place_token(1, token) }
      expect(connect_four.place_token(1, token)).to eq(error)
    end
  end

  describe '#validate_column?' do
    it 'Returns true if input is 1' do
      input = '1'
      expect(connect_four.validate_column?(input)).to be(true)
    end

    it 'Returns falsey if input is 8' do
      input = '8'
      validate_column = connect_four.validate_column?(input)
      expect(validate_column).to be_falsey
    end
  end

  describe '#create_players' do
    it 'Sends Player.new twice to Player' do
      expect(Player).to receive(:new).with(1)
      expect(Player).to receive(:new).with(2)
      connect_four.create_players
    end
  end

  describe '#game_loop' do
    context 'When #game_over? is false once' do
      before do
        allow(connect_four).to receive(:game_over?).and_return(false, true)
      end

      it 'Calls #player_turn once' do
        expect(connect_four).to receive(:player_turn).once
        connect_four.game_loop
      end
    end

    context 'When #game_over? is false twice' do
      before do
        allow(connect_four).to receive(:game_over?).and_return(false, false, true)
      end

      it 'Calls #player_turn twice' do
        expect(connect_four).to receive(:player_turn).twice
        connect_four.game_loop
      end
    end

    context 'When #game_over? is false five times' do
      before do
        allow(connect_four).to receive(:game_over?).and_return(false, false, false, false, false, true)
      end

      it 'Calls #player_turn five times' do
        expect(connect_four).to receive(:player_turn).exactly(5).times
        connect_four.game_loop
      end
    end
  end

  describe '#declare_winner' do
    it 'Returns winner message for player_one' do
      player_one = double('Player', name: 'player_one', score: 1)
      player_two = double('Player', name: 'player_two', score: 0)
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
      winner_message = 'The winner is player_one'
      expect(connect_four).to receive(:puts).with(winner_message)
      connect_four.declare_winner
    end

    it 'Returns winner message for player_two' do
      player_one = double('Player', name: 'player_one', score: 0)
      player_two = double('Player', name: 'player_two', score: 1)
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
      winner_message = 'The winner is player_two'
      expect(connect_four).to receive(:puts).with(winner_message)
      connect_four.declare_winner
    end
  end

  describe '#overall_winner' do
    it 'Returns overall winner message for player_one' do
      player_one = double('Player', name: 'player_one', rounds_won: 2)
      player_two = double('Player', name: 'player_two', rounds_won: 1)
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
      winner_message = 'The overall winner is player_one'
      expect(connect_four).to receive(:puts).with(winner_message)
      connect_four.overall_winner
    end

    it 'Returns overall winner message for player_two' do
      player_one = double('Player', name: 'player_one', rounds_won: 1)
      player_two = double('Player', name: 'player_two', rounds_won: 2)
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
      winner_message = 'The overall winner is player_two'
      expect(connect_four).to receive(:puts).with(winner_message)
      connect_four.overall_winner
    end

    it 'Returns overall winner message for a draw' do
      player_one = double('Player', name: 'player_one', rounds_won: 1)
      player_two = double('Player', name: 'player_two', rounds_won: 1)
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
      winner_message = "It's a draw!"
      expect(connect_four).to receive(:puts).with(winner_message)
      connect_four.overall_winner
    end
  end

  describe '#validate_play_again?' do
    it "Returns true if input is 'Y'" do
      input = 'Y'
      expect(connect_four.validate_play_again?(input)).to be(true)
    end

    it "Returns true if input is 'N'" do
      input = 'N'
      expect(connect_four.validate_play_again?(input)).to be(true)
    end

    it "Returns falsey if input is not 'Y' or 'N'" do
      input = 'X'
      expect(connect_four.validate_play_again?(input)).to be_falsey
    end
  end

  describe '#next_round' do
    let(:player_one) { instance_double(Player, name: 'Player 1', score: 0) }
    let(:player_two) { instance_double(Player, name: 'Player 2', score: 0) }

    before do
      connect_four.instance_variable_set(:@player_number_one, player_one)
      connect_four.instance_variable_set(:@player_number_two, player_two)
    end

    it 'Resets @board' do
      board = Array.new(6) { Array.new(7, '_') }
      allow(player_one).to receive(:reset_score)
      allow(player_two).to receive(:reset_score)
      allow(connect_four).to receive(:play_game).with(with_intro: false)
      connect_four.next_round
      expect(connect_four.board).to eq(board)
    end

    it 'Sends #reset_score to Player instances' do
      allow(connect_four).to receive(:play_game).with(with_intro: false)
      expect(player_one).to receive(:reset_score)
      expect(player_two).to receive(:reset_score)
      connect_four.next_round
    end
  end
end

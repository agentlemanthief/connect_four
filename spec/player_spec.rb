# Frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../lib/player'

describe 'Player' do
  subject(:player) { Player.new(1, nil, nil) }

  describe '#ask_name' do
    it 'Updates @name variable' do
      input = 'john'
      allow(player).to receive(:gets).and_return(input)
      player.ask_name
      expect(player.name).to eq('John')
    end
  end

  describe '#validate?' do
    it "Returns true if input is '1'" do
      input = '1'
      expect(player.validate?(input)).to be(true)
    end

    it "Returns true if input is '2'" do
      input = '2'
      expect(player.validate?(input)).to be(true)
    end

    it "Returns falsey if input is 'x'" do
      input = 'x'
      expect(player.validate?(input)).to be_falsey
    end
  end

  describe '#ask_token' do
    it "Updates @token variable to 'X'" do
      input = '1'
      allow(player).to receive(:gets).and_return(input)
      player.ask_token
      expect(player.token).to eq('X')
    end

    it "Updates @token variable to 'O'" do
      input = '2'
      allow(player).to receive(:gets).and_return(input)
      player.ask_token
      expect(player.token).to eq('O')
    end
  end

  describe '#add_score_point' do
    it 'Adds 1 to @score and @rounds_won' do
      player.add_score_point
      expect(player.score).to eq(1)
      expect(player.rounds_won).to eq(1)
    end
  end

  describe '#reset_score' do
    it 'Sets score back to 0' do
      player.instance_variable_set(:@score, 1)
      player.reset_score
      expect(player.score).to eq(0)
    end
  end
end

# rubocop:enable Metrics/BlockLength

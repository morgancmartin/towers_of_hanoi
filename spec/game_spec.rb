require "spec_helper"

describe TowersOfHanoi::Game do
  let(:move) { [1,3] }
  let(:game) { TowersOfHanoi::Game.new(bricks: 1) }
  let(:endgame){ TowersOfHanoi::Game.new(bricks: 1, moves: [move]) }

  describe "#over?" do
    it "begins false" do
      expect(game.over?).to be false
    end

    it "is true when all tiles are on the last tower" do
      expect(endgame.over?).to be true
    end
  end

  describe "#move" do
    it "adds the move to the list of moves" do
      expect{game.move(from: 1, to: 3)}.to change(game, :turns).by 1
    end

    it "changes the state of the board" do
      game.move(from: 1, to: 2)
      expect(game.board.tower(2).full?).to be true
      expect(game.board.tower(1).full?).to be false
    end
  end

  describe "#minimum_turns" do
    it "returns one less than 2 to the power of the number of bricks" do
      expect(game.minimum_turns).to eq(1)
    end
  end
end

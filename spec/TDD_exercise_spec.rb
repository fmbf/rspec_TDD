require 'rspec'
require 'TDD_exercise'

describe "Remove dups" do

  it "removes dups from array" do
    expect(remove_dups([1, 2, 2, 3])).to eq([1, 2, 3])
  end


end

describe "Two sum" do

  it "returns indices that sum to 0" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end

end


describe "My transpose" do
  rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

  answer = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  it "transposes an arr" do
    expect(my_transpose(rows)).to eq(answer)
  end

end

describe "Stock Picker" do
  stock_prices = [4, 2, 12, 34, 8, 6, 2]
  answer = [1, 3]
  it "picks most profitable day pairs to first buy/sell the stocks" do
    expect(stock_picker(stock_prices)).to eq(answer)
  end

end

describe "Towers of Hanoi" do
  subject(:game) { TowersofHanoi.new }

  describe "#initialize" do

    it "should have array to hold three towers" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end

    it "first tower should contain three disks" do
      expect(game.towers[0]).to eq([3, 2, 1])
    end

  end

  describe "#move" do

    it "should not allow moving from empty tower" do
      expect { game.move(1, 0) }.to raise_error("ILLEGAL!")
    end

    it "shouldn't put a bigger disk over a smaller one" do
      game.move(0, 1)
      expect { game.move(0, 1) }.to raise_error("Can't do this!")
    end

    it "destination should != source" do
      expect { game.move(0, 0) }.to raise_error("Can't move to same spot!")
    end
  end

  describe "#won?" do

    before(:each) do
      game.move(0, 2)
      game.move(0, 1)
      game.move(2, 1)
      game.move(0, 2)
      game.move(1, 0)
      game.move(1, 2)
      game.move(0, 2)
    end

    it "should check that the first tower is empty" do
      expect(game.towers[0]).to be_empty
    end

    it "checks if towers 1 & 2 contain all disks" do
      expect(game.towers).to eq([ [], [], [3, 2, 1] ])
        .or eq([ [], [3, 2, 1], [] ])
    end
  end
end

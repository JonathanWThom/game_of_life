require "spec_helper"
require "game"
require "cell"

describe Cell do

  describe "#neighors" do
    it "will return true if one cell is a neighbor of another" do
      cells = []
      (1..3).each do |x|
        (1..3).each do |y|
          cell = Cell.new(x, y)
          cells.push(cell)
        end
      end

      neighbors = []
      cells.each do |cell|
        middle_cell = Cell.new(2, 2)
        if middle_cell.neighbors(cell)
          neighbors.push(cell)
        end
      end

      expect(neighbors.count).to eq(4)
    end
  end

  describe "#less_than_two_neighbors" do
    it "Any live cell with fewer than two live neighbours dies, as if caused by underpopulation." do
      game = Game.new(1, 1, [0])
      game.next_turn
      expect(game.cells[0].living).to eq(false)
    end
  end

  it "Any live cell with two or three live neighbours lives on to the next generation." do
    game = Game.new(2, 2, [0, 1, 2])
    game.next_turn
    expect(game.cells[0].living).to eq(true)
  end

  describe "#more_than_three_neighbors" do
    it "Any live cell with more than three live neighbours dies, as if by overpopulation." do
      game = Game.new(3, 3, [1, 3, 4, 5, 7])
      game.next_turn
      expect(game.cells[4].living).to eq(false)
    end
  end

  describe "#exactly_three_neighbors" do
    it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      cell1 = Cell.new(3, 3)
      cell2 = Cell.new(2, 3)
      cell3 = Cell.new(3, 2)
      cell4 = Cell.new(3, 4)
      cell5 = Cell.new(10, 10)
      cell1.living = false
      game = Game.new(10, 10, cell1, cell2, cell3, cell4, cell5)
      game.next_turn
      expect(cell1.living).to eq(true)
    end
  end
end

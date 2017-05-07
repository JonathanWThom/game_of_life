require "spec_helper"
require "game"
require "cell"

describe Cell do
  it "Any live cell with fewer than two live neighbours dies, as if caused by underpopulation." do
    cell1 = Cell.new(1, 1)
    cell2 = Cell.new(3, 3)
    cell3 = Cell.new(4, 4)
    game = Game.new(cell1, cell2, cell3)
    game.next_turn
    expect(cell1.living).to eq(false)
  end

  it "Any live cell with two or three live neighbours lives on to the next generation." do
    cell1 = Cell.new(1, 1)
    cell2 = Cell.new(1, 2)
    cell3 = Cell.new(2, 1)
    game = Game.new(cell1, cell2, cell3)
    game.next_turn
    expect(cell1.living).to eq(true)
  end

  it "Any live cell with more than three live neighbours dies, as if by overpopulation." do

  end

  it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do

  end
end

require "./lib/cell"
require "./lib/string"
require "./lib/grid"
require "pry"

class Game
  attr_accessor :cells

  def initialize(grid_width, grid_height, living_cells, grid)
    @cells = []
    @living_cells = living_cells
    @grid = grid
    create_cells
  end

  def create_cells
    @grid.width.times do |x|
      @grid.height.times do |y|
        cell = Cell.new(x, y)
        @cells.push(cell)
      end
    end

    @living_cells.each do |cell|
      @cells[cell].living = true
    end
  end

  def next_turn
    @cells.each do |cell|
      if cell.less_than_two_neighbors(@cells)
        cell.future_living_state = false
      elsif cell.more_than_three_neighbors(@cells)
        cell.future_living_state = false
      elsif (cell.living == false) && (cell.exactly_three_neighbors(@cells))
        cell.future_living_state = true
      else
        cell.future_living_state = cell.living
      end
    end

    @cells.each do |cell|
      cell.living = cell.future_living_state
      cell.future_living_state = nil
    end
  end

  def start
    @grid.display_turns(@cells, self)
  end

end

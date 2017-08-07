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

puts "Enter grid width, then hit enter: "
width = gets.chomp
puts "Enter grid height, then hit enter: "
height = gets.chomp
grid = Grid.new(width, height)
grid.show_empty_grid
puts "Enter the index of which cells to start as living, separated by commas: "
living_cells = gets.chomp
living_cells = living_cells.convert_to_array
game = Game.new(width.to_i, height.to_i, living_cells, grid)
game.start

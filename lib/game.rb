require "./lib/cell"
require "pry"

class Game
  attr_accessor :cells

  def initialize(grid_width, grid_height, living_cells)
    @cells = []
    @living_cells = living_cells
    (1..grid_width).each do |x|
      (1..grid_height).each do |y|
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
      ## Doesn't quit work, as all should change at the same time, not one at a time.
    end

    @cells.each do |cell|
      cell.living = cell.future_living_state
      cell.future_living_state = nil
    end
  end

  def start
    @i = 1
    while @cells.any? { |cell| cell.living }
      puts "Generation #{@i}\n\n"
      @cells.map { |cell| puts "#{cell.x}, #{cell.y} = #{cell.living}"}
      puts "\n\n"
      self.next_turn
      @i += 1
      sleep 3
    end

    puts "Game Over \n\n"
    @cells.map { |cell| puts "#{cell.x}, #{cell.y} = #{cell.living}"}
  end

end

# game = Game.new(3, 3, [1, 2, 3, 4])
# game.start

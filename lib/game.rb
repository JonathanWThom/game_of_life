require "./lib/cell"
require "./lib/string"
require "pry"

class Game
  attr_accessor :cells
  attr_reader :grid_width, :grid_height

  def initialize(grid_width, grid_height, living_cells)
    @cells = []
    @living_cells = living_cells
    @grid_width = grid_width
    @grid_height = grid_height

    (1..@grid_width).each do |x|
      (1..@grid_height).each do |y|
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
    @i = 1
    while @cells.any? { |cell| cell.living }
      puts "Generation #{@i}\n\n"
      # @cells.map { |cell| puts "#{cell.x}, #{cell.y} = #{cell.living}"}
      show_grid
      puts "\n\n"
      self.next_turn
      @i += 1
      sleep 3
    end

    puts "Game Over \n\n"
    @cells.map { |cell| puts "#{cell.x}, #{cell.y} = #{cell.living}"}
  end

  def show_grid
    @cells.each_with_index do |cell, i|
      if i % @grid_width == 0
        puts "\n"
      end

      print "#{cell.living} "
    end

  end

end

puts "Enter grid width, then hit enter: "
width = gets.chomp
puts "Enter grid height, then hit enter: "
height = gets.chomp
puts "Enter the index of which cells to start as living, separated by commas: "
living_cells = gets.chomp
living_cells = living_cells.convert_to_array
game = Game.new(width.to_i, height.to_i, living_cells)
game.start

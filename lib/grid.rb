### To Do: Make grid object that handles display. Or display.rb

class Grid

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
  end

  attr_reader :width, :height

  def show_empty_grid
    number = @width * @height
    number.times do |i|
      if i % @width == 0
        puts "\n"
      end
      print "[#{i}]"
    end
    puts "\n\n"
  end

  def display_turns(cells, game)
    @i = 1
    while cells.any? { |cell| cell.living }
      puts "Generation #{@i}\n\n"
      show_grid(cells)
      puts "\n\n"
      game.next_turn
      @i += 1
      sleep 1
    end

    puts "Game Over \n\n"
  end

  def show_grid(cells)
    cells.each_with_index do |cell, i|
      if i % width == 0
        puts "\n"
      end
      print "#{cell.display}"
    end
  end

end

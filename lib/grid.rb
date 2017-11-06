### To Do: Make grid object that handles display. Or display.rb

class Grid

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @number = @width * @height
  end

  attr_reader :width, :height, :number

  def show_empty_grid
    number.times do |i|
      if i % width == 0
        puts "\n"
      end
      print_cell(i)
    end
    puts "\n\n"
  end

  def print_cell(i)
    spaces = get_spaces(i)
    print "[#{i}]"
    spaces.times do
      print " "
    end
  end

  def get_spaces(i)
    if number > 99
      if i <= 9
        4
      elsif i <= 99
        3
      else
        2
      end
    elsif number > 9 && i <= 9
      2
    else
      1
    end
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

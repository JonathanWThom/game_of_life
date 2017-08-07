### To Do: Make grid object that handles display. Or display.rb

class Grid
  #
  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
  end

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

end

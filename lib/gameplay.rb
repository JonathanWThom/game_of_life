require "./lib/game"

class Gameplay
  def play
    width = get_dimension("width")
    height = get_dimension("height")

    if width * height > 999
      puts "Please create a smaller grid\n\n"
      play
    end

    grid = Grid.new(width, height)
    grid.show_empty_grid
    living_cell_numbers = get_living_cell_numbers
    game = Game.new(width.to_i, height.to_i, living_cell_numbers, grid)
    game.start
  end

  def get_dimension(dimension)
    puts "Enter grid #{dimension.to_s}, then hit enter: "
    value = gets.chomp
    if value.to_i == 0
      puts "Please enter a number: \n\n"
      send("get_#{dimension}")
    else
      value.to_i
    end
  end

  def get_living_cell_numbers
    puts "Enter the numbers of which cells you want to start as living, separated by commas: "
    living_cell_numbers = gets.chomp
    living_cell_numbers = living_cell_numbers.convert_to_array
    if invalid_cell_numbers(living_cell_numbers)
      puts "Please enter valid numbers\n\n"
      get_living_cells
    else
      living_cell_numbers
    end
  end

  def invalid_cell_numbers(living_cell_numbers)
    ## wish I could use rails validations
    ## some sort of plain ruby validator?
    duplicates?(living_cell_numbers) ||
    bad_characters?(living_cell_numbers) ||
    invalid_numbers?(living_cell_numbers) ||
    nil_value_entered?(living_cell_numbers)
  end

  def bad_characters?(living_cell_numbers)
  end

  def duplicates?(living_cell_numbers)
  end

  def invalid_numbers?(living_cell_numbers)
  end

  def nil_value_entered?(living_cell_numbers)
  end
end

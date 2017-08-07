class Cell
  attr_accessor :x, :y, :living, :future_living_state

  def initialize(x, y)
    @x = x
    @y = y
    @living = false
    @future_living_state = false
  end

  def neighbors(cells)
    neighbors = []
    cell_index = cells.find_index(self)

    cells.each_with_index do |cell, i|
      if x_within_one(cell) && y_within_one(cell) && (i != cell_index)
        neighbors.push(cell)
      end
    end

    neighbors
  end

  def living_neighbors_count(cells)
    living_neighbors = neighbors(cells).select { |cell| cell.living }
    living_neighbors.count
  end

  def x_within_one(cell)
    (x - cell.x).abs <= 1
  end

  def y_within_one(cell)
    (y - cell.y).abs <= 1
  end

  def x_y_total
    x + y
  end

  def less_than_two_neighbors(cells)
    living_neighbors_count(cells) < 2
  end

  def more_than_three_neighbors(cells)
    living_neighbors_count(cells) > 3
  end

  def exactly_three_neighbors(cells)
    living_neighbors_count(cells) == 3
  end
end

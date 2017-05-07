class Cell
  attr_accessor :x, :y, :living

  def initialize(x, y)
    @x = x
    @y = y
    @living = true
  end

  def less_than_two_neighbors(cells)
    neighbors = []
    cells.each do |cell|
      if cell.living
        if self.neighbors(cell)
          neighbors.push(cell)
        end
      end
    end
    neighbors.count < 2
  end

  def three_or_more_neighbors(cells)
    neighbors = []
    cells.each do |cell|
      if cell.living
        if self.neighbors(cell)
          neighbors.push(cell)
        end
      end
    end
    neighbors.count > 3
  end

  def exactly_three_neighbors(cells)
    neighbors = []
    cells.each do |cell|
      if cell.living
        if self.neighbors(cell)
          neighbors.push(cell)
        end
      end
    end
    neighbors.count == 3
  end

  def x_y_total
    x + y
  end

  def neighbors(cell)
    ((cell.x_y_total - self.x_y_total).abs == 1) && ((cell.x == self.x) || (cell.y == self.y))
  end

end

class Cell
  attr_accessor :x, :y, :living

  def initialize(x, y)
    @x = x
    @y = y
    @living = true
  end

  ## test
  def less_than_two_neighbors(cells)
    neighbors = []
    cells.each do |cell|
      if cell.living
        if ((cell.x - self.x).abs < 2) || ((cell.y - self.y).abs < 2)
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
        if ((cell.x - self.x).abs < 2) || ((cell.y - self.y).abs < 2)
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
        if ((cell.x - self.x).abs < 2) || ((cell.y - self.y).abs < 2)
          neighbors.push(cell)
          binding.pry
        end
      end
    end
    neighbors.count == 3
  end


end


## cells must be living to do things

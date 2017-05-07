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
      if ((cell.x - self.x).abs < 2) || ((cell.y - self.y).abs < 2)
        neighbors.push(cell)
      end
    end
    ## it will be colocated/a "neighbor" to itself
    neighbors.count < 3
  end

end

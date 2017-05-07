class Game
  attr_accessor :cells

  ## write so you can push as many as you want in
  def initialize(cell1, cell2, cell3)
    @cells = [cell1, cell2, cell3]
  end

  def next_turn
    @cells.each do |cell|
      if cell.less_than_two_neighbors(@cells)
        cell.living = false
      end
    end
  end
end

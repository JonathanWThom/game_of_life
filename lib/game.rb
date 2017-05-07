class Game
  attr_accessor :cells

  ## write so you can push as many as you want in
  def initialize(cell1, cell2, cell3, cell4, cell5)
    @cells = [cell1, cell2, cell3, cell4, cell5]
  end

  def next_turn
    @cells.each do |cell|
      if cell.less_than_two_neighbors(@cells)
        cell.living = false
      elsif cell.three_or_more_neighbors(@cells)
        cell.living = false
      elsif (cell.living == false) && (cell.exactly_three_neighbors(@cells))
        cell.living = true
      end
    end
  end


end

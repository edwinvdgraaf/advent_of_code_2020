class DayThree::Grid
  def initialize(grid_input)
    @grid = grid_input.split("\n").map { |line| line.strip }
    @mod_x = @grid[0].length
  end

  def vertical_max
    @grid.length
  end

  def horizontal_max
    Float::INFINITY
  end

  def position_at(x, y)
    normalized_x = x % @mod_x
    if @grid[y]
      @grid[y][normalized_x]
    end
  end
end
class DayThree::Walker
  # So much nice Enumerator possible be here
  def initialize(grid, step_vector)
    @grid, @step_vector, @current_position = grid, step_vector, [0, 0]
  end

  def collect
    values = []
    next_value = self.next
    while next_value != nil do
      values += [next_value]
      next_value = self.next
    end
    values
  end

  def next
    next_position = [@current_position, @step_vector].transpose.map(&:sum)
    @current_position = next_position
    current
  end

  def current
    @grid.position_at(*@current_position)
  end
end
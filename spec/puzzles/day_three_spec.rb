require "advent_of_code_2020/puzzles/day_three"

RSpec.describe DayThree do
  describe DayThree::Grid do
    it "reports whats on position x, y" do
      grid = build_grid
      expect(grid.vertical_max).to be(12)
      expect(grid.horizontal_max).to be(Float::INFINITY)
      expect(grid.position_at(0, 0)).to eq(".")
      expect(grid.position_at(0, 1)).to eq("#")
      expect(grid.position_at(12, 1)).to eq(".")
      expect(grid.position_at(12, 4)).to eq("#")
      expect(grid.position_at(13, 0)).to eq("#")
      expect(grid.position_at(14, 0)).to eq("#")
      expect(grid.position_at(15, 0)).to eq(".")
      expect(grid.position_at(16, 0)).to eq(".")
    end
  end

  describe DayThree::Walker do
    it "walker walks the grid" do
      grid = build_grid
      walker = DayThree::Walker.new(grid, [3, 1])
      expect(walker.current).to eq(".")
      expect(walker.next).to eq(".")
      expect(walker.next).to eq("#")
      expect(walker.next).to eq(".")
      expect(walker.next).to eq("#")
    end

    it "collects values for every step" do
      grid = build_grid
      walker = DayThree::Walker.new(grid, [3, 1])
      expect(walker.collect).to eq([".", "#", ".", "#", "#", ".", "#", "#", "#", "#"])
    end

    
    [
      [[1, 1], 2],
      [[3, 1], 7],
      [[5, 1], 3],
      [[7, 1], 4],
      [[1, 2], 2],
    ].each do |slop_with_result|
      it "works with a #{slop_with_result[0]} vector" do
        slope, result = slop_with_result[0], slop_with_result[1] 
        grid = build_grid

        walker = DayThree::Walker.new(grid, slope)
        expect(walker.collect.filter { |x| x == "#"}.length).to eq(result)
      end
    end
  end
end

def build_grid
  input = "..##.......
  #...#...#..
  .#....#..#.
  ..#.#...#.#
  .#...##..#.
  ..#.##.....
  .#.#.#....#
  .#........#
  #.##...#...
  #...##....#
  .#..#...#.#
  "

  DayThree::Grid.new(input)
end

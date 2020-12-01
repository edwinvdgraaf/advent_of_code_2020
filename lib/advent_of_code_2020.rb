require "advent_of_code_2020/version"

module AdventOfCode2020
  class Error < StandardError; end
  # Your code goes here...

  def self.load(puzzle)
    puts "Loading: #{puzzle}"
    require "advent_of_code_2020/puzzles/#{puzzle}.rb"
    klass = Kernel.const_get(puzzle.to_s.split('_').collect(&:capitalize).join)
    klass.new.call
  end
end

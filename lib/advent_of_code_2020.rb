require "advent_of_code_2020/version"

module AdventOfCode2020
  class Error < StandardError; end
  # Your code goes here...

  def self.load(puzzle)
    puts "Loading: #{puzzle}"
    require "advent_of_code_2020/puzzles/#{puzzle}.rb"
    klass_or_module = Kernel.const_get(puzzle.to_s.split('_').collect(&:capitalize).join)
    
    if klass_or_module.instance_of? Module
      return klass_or_module.call
    else
      klass_or_module.new.call
    end
  end
end

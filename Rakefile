require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "pry"

require "advent_of_code_2020"

RSpec::Core::RakeTask.new(:spec)

task :run do
  puzzle = :day_one
  AdventOfCode2020::load(puzzle)
end

task :default => :spec

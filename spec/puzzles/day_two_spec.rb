require "advent_of_code_2020/puzzles/day_two"

RSpec.describe DayTwo::Validator do
  it "validates given password based on occurrences" do
    validator = DayTwo::Validator.new
    expect(validator.validate(:occurrences, "abc", "c", 0, 1)).to be(true)
    expect(validator.validate(:occurrences, "ccccccccc", "c", 2, 9)).to be(true)
  end

  it "validates given password based on position" do
    validator = DayTwo::Validator.new
    expect(validator.validate(:position, "abcde", "a", 1, 3)).to be(true)
    expect(validator.validate(:position, "ccccccccc", "c", 2, 9)).to be(false)
  end
end

RSpec.describe DayTwo::Parser do
  it "validates given password" do
    parser = DayTwo::Parser.new
    expect(parser.parse("1-3 a: abcde")).to eq(["abcde", "a", 1, 3])
  end
end
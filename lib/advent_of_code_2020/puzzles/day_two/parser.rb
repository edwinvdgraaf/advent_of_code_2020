class DayTwo::Parser
  def parse(line)
    tokens = line.split(" ")
    occurence = tokens[0].split("-")
    [tokens[2], tokens[1].sub(":", ""), occurence[0].to_i, occurence[1].to_i]
  end
end
defmodule AoCDay01Test do
  use ExUnit.Case

  test "part1" do
    assert AoC.Day01.part1("inputs/day01.sample") == 3
    assert AoC.Day01.part1("inputs/day01") == 1141
  end

  test "part2" do
    assert AoC.Day01.part2("inputs/day01.sample") == 6
    assert AoC.Day01.part2("inputs/day01") == 6634
  end
end

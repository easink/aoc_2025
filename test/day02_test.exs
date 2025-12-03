defmodule AoCDay02Test do
  use ExUnit.Case

  test "part1" do
    assert AoC.Day02.part1("inputs/day02.sample") == 1_227_775_554
    assert AoC.Day02.part1("inputs/day02") == 32_976_912_643
  end

  test "part2" do
    assert AoC.Day02.part2("inputs/day02.sample") == 4_174_379_265
    assert AoC.Day02.part2("inputs/day02") == 54_446_379_122
  end
end

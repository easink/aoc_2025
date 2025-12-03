defmodule AoC.Day01 do
  @moduledoc false

  def part1(filename) do
    filename
    |> parse()
    |> Enum.scan({0, 50}, &rotate/2)
    |> Enum.map(&elem(&1, 1))
    |> Enum.count(&(&1 == 0))
  end

  def part2(filename) do
    filename
    |> parse()
    |> Enum.scan({0, 50}, &rotate/2)
    |> List.last()
    |> elem(0)
  end

  defp rotate({times_with, with}, {times, rot}) do
    res = with + rot
    times = times + times_with

    cond do
      res < 0 and rot == 0 -> {times, res + 100}
      res < 0 -> {times + 1, res + 100}
      res >= 100 and rot == 0 -> {times, res - 100}
      res >= 100 -> {times + 1, res - 100}
      res == 0 -> {times + 1, res}
      res -> {times, res}
    end
  end

  defp parse(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(<<dir, rot::binary>>) do
    rot = String.to_integer(String.trim_trailing(rot))

    case dir do
      ?L -> {div(rot, 100), -rem(rot, 100)}
      ?R -> {div(rot, 100), rem(rot, 100)}
    end
  end
end

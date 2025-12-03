defmodule AoC.Day02 do
  @moduledoc false

  def part1(filename) do
    filename
    |> parse()
    |> Enum.filter(&is_silly_pattern/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part2(filename) do
    filename
    |> parse()
    |> Enum.filter(&is_really_silly_pattern/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  defp is_silly_pattern(string),
    do: Regex.match?(~r/^(.+)\1$/, string)

  defp is_really_silly_pattern(string),
    do: Regex.match?(~r/^(.+)(\1)+$/, string)

  defp parse(filename) do
    filename
    |> File.read!()
    |> parse_line()
    |> Enum.map(&to_strings/1)
    |> List.flatten()
  end

  defp parse_line(line) do
    line
    |> String.trim_trailing()
    |> String.split(",")
    |> Enum.map(&String.split(&1, "-"))
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2)
  end

  defp to_strings([a, b]), do: for(n <- a..b, do: to_string(n))
end

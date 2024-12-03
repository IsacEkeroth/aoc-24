import Enum

defmodule Day1 do
  def get_input() do
    case File.read("input.txt") do
      {:ok, content} ->
        content
        |> String.split("\n", trim: true)
        |> Enum.map(&split_input/1)

      # |> Enum.map(&String.to_integer/1)

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
        []
    end
  end

  defp split_input(xs) do
    parts = String.split(xs, " ", trim: true)
    {hd(parts), hd(tl(parts))}
  end

  def pair_number(pairs) do
    {xs, ys} = unzip(pairs)
    sorted_xs = sort(xs)
    sorted_ys = sort(ys)
    {sorted_xs, sorted_ys}
  end

  def calc_distance({xs, ys}) do
    Enum.zip(xs, ys)
    |> Enum.map(fn {x, y} -> abs(String.to_integer(x) - String.to_integer(y)) end)
  end

  def total_distance(xs) do
    sum(xs)
  end

  def run() do
    get_input()
    |> IO.inspect(label: "Input", limit: 10)
    |> pair_number()
    |> IO.inspect(label: "Pairs", limit: 10)
    |> calc_distance()
    |> IO.inspect(label: "Distances", limit: 10)
    |> total_distance()
    |> IO.inspect(label: "Total Distance")
  end
end

Day1.run()

defmodule Day1 do
  def run_pt1() do
    "input.txt"
    |> read_file()
    |> parse_input()
    |> pair_numbers()
    |> calculate_distances()
    |> total_distance()
    |> IO.inspect(label: "Total Distance")
  end

  def run_pt2() do
    "input.txt"
    |> read_file()
    |> parse_input()
    |> pair_numbers()
    |> calculate_similarity()
    |> IO.inspect(label: "similarity")
  end

  defp read_file(filename) do
    case File.read(filename) do
      {:ok, content} ->
        content

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
        ""
    end
  end

  defp parse_input(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&split_input/1)
  end

  defp split_input(line) do
    [x, y] = String.split(line, " ", trim: true)
    {String.to_integer(x), String.to_integer(y)}
  end

  defp pair_numbers(pair) do
    {xs, ys} = Enum.unzip(pair)
    {Enum.sort(xs), Enum.sort(ys)}
  end

  defp calculate_distances({xs, ys}) do
    Enum.zip(xs, ys)
    |> Enum.map(fn {x, y} -> abs(x - y) end)
  end

  defp total_distance(distances) do
    Enum.sum(distances)
  end

  defp calculate_similarity({xs, ys}) do
    Enum.reduce(xs, 0, fn x, acc ->
      acc + count_matches(ys, x) * x
    end)
  end

  defp count_matches(ys, x) do
    Enum.count(ys, fn y -> y == x end)
  end
end

Day1.run_pt1()
Day1.run_pt2()

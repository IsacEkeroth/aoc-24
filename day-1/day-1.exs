import Enum

defmodule Day1 do
  def run() do
    "input.txt"
    |> read_file()
    |> parse_input()
    |> pair_numbers()
    |> calculate_distances()
    |> total_distance()
    |> IO.inspect(label: "Total Distance")
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
    {x, y}
  end

  defp pair_numbers(pairs) do
    {xs, ys} = Enum.unzip(pairs)
    {Enum.sort(xs), Enum.sort(ys)}
  end

  defp calculate_distances({xs, ys}) do
    Enum.zip(xs, ys)
    |> Enum.map(fn {x, y} -> abs(String.to_integer(x) - String.to_integer(y)) end)
  end

  defp total_distance(distances) do
    Enum.sum(distances)
  end
end

Day1.run()

defmodule Day2 do
  def run_pt1() do
    "input.txt"
    |> read_file()
    |> parse_input()
    |> count_safe_reports()
    |> IO.inspect(label: "output")
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
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn line -> Enum.map(line, &String.to_integer/1) end)
  end

  defp count_safe_reports(reports) do
    Enum.count(reports, &safe_report?/1)
  end

  defp safe_report?(levels) do
    increasing?(levels) or decreasing?(levels)
  end

  defp increasing?([x, y | rest]) when (y - x) in 1..3, do: increasing?([y | rest])
  defp increasing?([_]), do: true
  defp increasing?(_), do: false

  defp decreasing?([x, y | rest]) when (x - y) in 1..3, do: decreasing?([y | rest])
  defp decreasing?([_]), do: true
  defp decreasing?(_), do: false
end

Day2.run_pt1()

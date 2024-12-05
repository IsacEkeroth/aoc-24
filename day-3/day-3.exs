defmodule Day3 do
  def run_pt1() do
    "input_whole.txt"
    |> read_file()
    |> parse_input()
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
    regex_mul = ~r/mul\(\d{1,3},\d{1,3}\)/
    regex_numbers = ~r/\d{1,3}/

    Regex.scan(regex_mul, content)
    |> Enum.map(&(Regex.scan(regex_numbers, hd(&1)) |> Enum.concat()))
    |> Enum.reduce(
      0,
      fn x, acc -> acc + String.to_integer(hd(x)) * String.to_integer(hd(tl(x))) end
    )
  end
end

Day3.run_pt1()

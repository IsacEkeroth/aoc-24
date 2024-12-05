defmodule Day3 do
  def run() do
    "input_whole.txt"
    |> read_file()
    |> parse_input()
    |> calc_switch()
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
    regex_mul = ~r/(mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\))/

    Regex.scan(regex_mul, content)
    |> Enum.map(&hd(&1))
  end

  defp multiply_numbers([x, y | []]) do
    String.to_integer(x) * String.to_integer(y)
  end

  defp calc_mul(x) do
    regex_numbers = ~r/\d{1,3}/

    Regex.scan(regex_numbers, x)
    |> Enum.concat()
    |> multiply_numbers()
  end

  defp calc_switch(xs), do: calc_switch(xs, :do)

  defp calc_switch([], _), do: 0
  defp calc_switch(["do()" | xs], _), do: calc_switch(xs, :do)
  defp calc_switch(["don't()" | xs], _), do: calc_switch(xs, :dont)
  defp calc_switch([x | xs], :do), do: calc_mul(x) + calc_switch(xs, :do)
  defp calc_switch([_x | xs], :dont), do: calc_switch(xs, :dont)
end

Day3.run()

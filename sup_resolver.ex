defmodule SupResolver do
  def solve(name_list, group_size) do
    name_list
    |> Enum.shuffle()
    |> Enum.chunk_every(group_size)
    |> Enum.reject(fn grouping -> length(grouping) == 1 end)
  end
end

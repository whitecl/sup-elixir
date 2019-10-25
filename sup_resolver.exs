defmodule SupResolver do
  def solve(id_list, group_size) do
    id_list
    |> Enum.shuffle()
    |> Enum.chunk_every(group_size)
  end
end

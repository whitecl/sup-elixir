defmodule Persistence do
  def persist(groups, filepath) do
    output =
      load(filepath)
      |> List.insert_at(-1, groups)
      |> Poison.encode!()

    File.write(filepath, output, [:write])
    :ok
  end

  def load(filepath) do
    case(File.read(filepath)) do
      {:ok, raw_json} ->
        Poison.decode!(raw_json)

      {:error, _any} ->
        []
    end
  end
end

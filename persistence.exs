defmodule Persistence do
  import Poison

  def persist(groups, filepath) do
    output = Poison.encode!(groups)
    File.write(filepath, output, [:write])
    :ok
  end

  def load(filepath) do
    {:ok, raw_json} = File.read(filepath)
    Poison.decode!(raw_json)
  end
end

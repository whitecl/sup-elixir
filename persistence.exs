defmodule Persistence do
  import Poison

  def persist(groups, filepath) do
    output = Poison.encode!(groups)
    File.write(filepath, output, [:write])
    :ok
  end
end

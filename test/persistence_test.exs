Code.load_file("../persistence.exs", __DIR__)

defmodule PersistenceTest do
  use ExUnit.Case
  import Mock

  describe "persist" do
    test "saves sup groups into a JSON file" do
      groups = [
        ["David", "John", "Christopher"],
        ["Robert", "Sonny", "Sebastian"],
        ["Fitzwilliaam", "Martin", "Lisa"]
      ]

      expected_output = ""

      with_mock File,
        write: fn _path, _output, [:write] -> :ok end do
        assert :ok = Persistence.persist(groups, "test/output.json")
        assert_called(File.write(expected_output, "test/output.json"))
      end
    end
  end
end

Code.load_file("../persistence.exs", __DIR__)

defmodule PersistenceTest do
  use ExUnit.Case
  import Mock

  describe "persist" do
    test "saves sup groups into a new JSON file when the store does not exist yet" do
      groups = [
        ["David", "John", "Bob"],
        ["Robert", "Sonny", "Sebastian"],
        ["Fitzwilliaam", "Martin", "Lisa"]
      ]

      expected_output = Poison.encode!([groups])

      with_mock(
        File,
        [:passthrough],
        write: fn _path, _output, [:write] -> :ok end
      ) do
        assert :ok = Persistence.persist(groups, "output.json")
        assert_called(File.write("output.json", expected_output, [:write]))
      end
    end

    test "appends the sup groups into the existing JSON file when store exists" do
      append_groups = [
        ["Robert", "Williams", "Foster"]
      ]

      expected_output =
        List.insert_at(Persistence.load("test/test_store.json"), -1, append_groups)

      encoded_output = Poison.encode!(expected_output)

      with_mock(
        File,
        [:passthrough],
        write: fn _path, _output, [:write] -> :ok end
      ) do
        assert :ok = Persistence.persist(append_groups, "test/test_store.json")

        assert_called(File.write("test/test_store.json", encoded_output, [:write]))
      end
    end
  end

  describe "load" do
    test "returns the group sets from file" do
      groups = [
        ["David", "John", "Christopher"],
        ["Robert", "Sonny", "Sebastian"],
        ["Fitzwilliaam", "Martin", "Lisa"]
      ]

      assert groups = Persistence.load("test/test_store.json")
    end

    test "returns an empty array when the file does not exist" do
      assert [] = Persistence.load("four-oh-four.json")
    end
  end
end

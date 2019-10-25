Code.load_file("sup_resolver.exs", __DIR__)

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule SupResolverTest do
  use ExUnit.Case

  test "takes a list of ids and returns groupings" do
    ids = [1, 2, 3, 4, 5, 6, 7]
    group_size = 2
    result = SupResolver.solve(ids, group_size)

    assert length(Enum.at(result, 0)) == 2
    assert length(Enum.at(result, 1)) == 2
    assert length(Enum.at(result, 2)) == 2
  end

  test "it returns a random result every time" do
    ids = [1, 2, 3, 4, 5, 6, 7]
    group_size = 2
    result1 = SupResolver.solve(ids, group_size)
    result2 = SupResolver.solve(ids, group_size)

    assert Enum.at(result1, 0) != Enum.at(result2, 0)
  end

  @tag :pending
  test "it prevents a grouping from having size of 1"

  @tag :pending
  test "it loads previous groupings and returns new groups"

  @tag :pending
  test "it persists groupings"
end

Code.load_file("../sup_resolver.ex", __DIR__)

defmodule SupResolverTest do
  use ExUnit.Case
  @names ["Chris", "Kevin", "Adam", "Trever", "Randy", "Jason", "Nate"]

  test "takes a list of ids and returns groupings" do
    group_size = 2
    result = SupResolver.solve(@names, group_size)

    assert length(Enum.at(result, 0)) == 2
    assert length(Enum.at(result, 1)) == 2
    assert length(Enum.at(result, 2)) == 2
  end

  test "it returns a random result every time" do
    group_size = 2
    result1 = SupResolver.solve(@names, group_size)
    result2 = SupResolver.solve(@names, group_size)

    assert Enum.at(result1, 0) != Enum.at(result2, 0)
  end

  test "it prevents a grouping from having size of 1" do
    last_group =
      @names
      |> SupResolver.solve(2)
      |> Enum.at(-1)

    assert length(last_group) !== 1
  end

  @tag :pending
  test "it loads previous groupings and returns new groups"

  @tag :pending
  test "it persists groupings"
end

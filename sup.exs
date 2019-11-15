Code.load_file("sup_resolver.exs", __DIR__)

names = System.argv()
help_triggers = ["", "-h", "--help"]

if Enum.at(names, 0) in help_triggers || length(names) == 0 do
  IO.puts("Usage: elixir sup.exs name1 name2 name3 etc")
  System.halt(0)
end

IO.puts("Results for #{length(names)} names:")

names
|> SupResolver.solve(2)
|> Enum.each(fn group -> IO.puts(Enum.join(group, " & ")) end)

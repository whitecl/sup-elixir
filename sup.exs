Code.load_file("sup_resolver.exs", __DIR__)

names = System.argv()
IO.puts("Results for #{length(names)} names:")

names
|> SupResolver.solve(2)
|> Enum.each(fn group -> IO.puts(Enum.join(group, " & ")) end)

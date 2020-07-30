require IO
defmodule MyRandomModule do
  def user, do: :Cristi
  def somefunc() do
    IO.puts("Hello #{MyRandomModule.user}!")
  end
end

defmodule MyRecursiveModule do
  def recPrint(msg, repeats) when repeats<=1 do
    IO.puts("The message to be printed is: \"#{msg}\"\nThis was the last print for #{MyRandomModule.user}")
  end
  def recPrint(msg, repeats) do
    IO.puts("The message to be printed is: \"#{msg}\"\n#{repeats-1} print(s) left for #{MyRandomModule.user}")
    recPrint(msg, repeats-1)
  end
end

MyRandomModule.somefunc()
MyRecursiveModule.recPrint("Mesaj interesant", 10)

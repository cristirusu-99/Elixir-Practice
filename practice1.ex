require IO
require Integer
require String

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


defmodule MyStruct do
  defstruct field1: 10, field2: "ZECE"
  def printable(struct), do: "Numarul " <> Integer.to_string(struct.field1) <> " este scris " <> struct.field2
end

zece = %MyStruct{}

MyRandomModule.somefunc()
MyRecursiveModule.recPrint("Mesaj interesant <#{MyStruct.printable(zece)}>", 10)

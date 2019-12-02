# Run with the following command:
# mix run .\lib\demonstration.exs

import Compare
IO.puts " "
IO.puts "$> import Compare"
IO.puts " "

IO.puts "$> compare(\"hihellothere\",\"reddit\")"
IO.puts compare("hihellothere", "reddit")

IO.puts " "

IO.puts "$> compare(\"hihellothere\", \"reddit\", :alphabetical)"
IO.puts compare("hihellothere", "reddit", :alphabetical)

IO.puts " "

IO.puts "$> compare(\"hello\", \"hello\")"
IO.puts compare("hello", "hello")

IO.puts " "

xs = "[3,2,5,7,9,4,1,6,8]"

IO.puts "$> list = " <> xs
IO.puts xs

IO.puts " "

IO.puts "$> sort(list)"
IO.puts "[1,2,3,4,5,6,7,8,9]"

IO.puts " "

IO.puts "$> sort(list, :descend)"
IO.puts "[9,8,7,6,5,4,3,2,1]"

IO.puts " "

xs = "[\"elephant\",\"doggy\",\"cat\",\"bird\"]"

IO.puts ("$> list = " <> xs)
IO.puts "$> sort(list)"
IO.puts "[\"cat\",\"bird\",\"doggy\",\"elephant\",]"

IO.puts " "

IO.puts "$> sort(list, :descend)"
IO.puts "[\"elephant\",\"doggy\",\"bird\",\"cat\",]"

IO.puts " "

IO.puts "$> sort(list, :ascend, :alphabetical)"
IO.puts "[\"bird\",\"cat\",\"doggy\",\"elephant\"]"

IO.puts "\n"

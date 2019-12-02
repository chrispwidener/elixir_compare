## Compare

Example:

```
$> import Compare

$> compare("hihellothere","reddit")
GT

$> compare("hihellothere", "reddit", :alphabetical)
LT

$> compare("hello", "hello")
EQ

$> list = [3,2,5,7,9,4,1,6,8]
[3,2,5,7,9,4,1,6,8]

$> sort(list)
[1,2,3,4,5,6,7,8,9]

$> sort(list, :descend)
[9,8,7,6,5,4,3,2,1]

$> list = ["elephant","doggy","cat","bird"]
$> sort(list)
["cat","bird","doggy","elephant",]

$> sort(list, :descend)
["elephant","doggy","bird","cat",]

$> sort(list, :ascend, :alphabetical)
["bird","cat","doggy","elephant"]
```
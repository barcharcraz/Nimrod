discard """
  file: "tovergen.nim"
  output: '''least specialized
more specialized
most specialized'''
"""

type Foo[T] = distinct T
proc test[T](a: T) =
  echo "least specialized"
proc test[T](a: Foo[T]) =
  echo "more specialized"
proc test[T](a: Foo[Foo[T]]) =
  echo "most specialized"

var gener: Foo[int] = Foo[int](4)
var conc: int = 5
var really_generic: Foo[Foo[int]] = Foo[Foo[int]](6)
test(conc)
test(gener)
test(really_generic)
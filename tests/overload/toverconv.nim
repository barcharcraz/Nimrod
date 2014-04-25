discard """
  file: "toverconv.nim"
  output: '''4'''
"""
# tests making more than one hop through converter functions
type T1 = distinct int
type T2 = distinct int
converter toT1(other: T2): T1 = cast[T1](other)
converter toInt(other: T1): int = cast[int](other)
proc foo(i: int) = echo i

var test: T2 = 4.T2
foo(test)
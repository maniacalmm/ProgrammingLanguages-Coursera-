fun range i j = if i > j then [] else i :: range (i + 1) j

val exe1 = range 1 20

fun exists predicate xs =
    case xs of
        [] => false
        | x :: xs' => predicate x orelse exists predicate xs'

val hasZero = exists (fn x => x = 0)
val exe2 = hasZero [1,3,5,3,4,0,6]

val hasEvenNumber = exists (fn x => x mod 2 = 0)

val exe3 = hasEvenNumber [1,3,5,7,9]

val removeEven = List.filter (fn x => x mod 2 <> 0)
val exe4 = removeEven [1,2,3,4,5,6,7,8]
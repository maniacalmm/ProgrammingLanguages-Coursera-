fun sorted3_tupled (x, y, z) = z >= y andalso y >= x

val t1 = sorted3_tupled(3,4,5)

(* new way : currying *)

val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x

val t2 = ((sorted3 3) 9) 11

fun sorted_nicer x y z = z >= y andalso y >= x

val t3 = sorted_nicer 5 6 5
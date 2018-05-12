val x = 1

fun f y =
    let
        val x = y + 1
    in
        fn z => x + y + z
    end

val x = 3

val g = f 4

val z = g 10

fun f1 g =
    let val x = 3
    in g 2 end
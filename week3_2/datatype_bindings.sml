datatype mytype =
    TWOINT of int * int
    | STR of string
    | PIZZA


val a = STR "yoo"
val b = TWOINT (3, 4)
val c = PIZZA

fun f(x: mytype) =
    case x of
        PIZZA => 15
        | STR s => 8
        | TWOINT(x, y) => x + y

fun g(x : mytype) =
    case x of PIZZA => "pizza"
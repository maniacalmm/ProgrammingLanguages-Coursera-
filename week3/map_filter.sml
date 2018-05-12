fun map(f, xs) =
    case xs of
        [] => []
        |x :: xs' => f x :: map(f, xs')

fun filter(f, xs) =
    case xs of
        [] => []
        | x :: xs' => if f(x)
                      then x :: filter(f, xs')
                      else filter(f, xs')

fun fold(f, acc, xs) =
    case xs of
        [] => acc
        | x :: xs' => fold(f, f(acc, x), xs')

val x1 = map(fn x => x + 1, [1,2,3,4,5,6,7])
val x2 = map(hd, [[1,2],[3,4],[5,6]])
val x3 = filter(fn x => x mod 2 = 0, [1,2,3,4,5,6,7,8,56,45,34,1,2,3,45,6,2,3,4,5,3,4,5]);
val x4 = fold(fn (x, y) => x + y, 0, [1,2,3,4,5,6])
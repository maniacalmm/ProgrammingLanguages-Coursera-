fun n_times(f, n, x) =
    if n = 0
    then x
    else f(n_times(f, n-1, x))

fun increment x = x + 1
fun double x = x + x

val x1 = n_times(increment, 10, 1)
val x2 = n_times(double, 10 ,1)
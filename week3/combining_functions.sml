fun compose (f, g) = fn x => f(g x)

fun sqrt_of_abs i = Math.sqrt (Real.fromInt (abs(i)))

val sqrt_of_abs_o = Math.sqrt o Real.fromInt o abs

val s1 = sqrt_of_abs ~324
val s2 = sqrt_of_abs_o ~324

infix !>
fun x !> f = f x

fun sqrt_of_abs_i x = x !> abs !> Real.fromInt !> Math.sqrt


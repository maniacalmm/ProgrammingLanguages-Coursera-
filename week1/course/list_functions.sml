fun sum_list(xs : int list) =
    if (null xs)
    then 0
    else hd xs + sum_list(tl xs)


fun multiply_list (xs : int list) =
    if (null xs)
    then 1
    else (hd xs) * multiply_list(tl xs)

fun countdown(x : int) =
    if x < 0
    then []
    else x :: countdown(x - 1)

fun append(xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys)

fun sum_pair_list (xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

val sum = sum_list([1,2,3,4,5,6,7,8])
val mul = multiply_list([1,2,3,4,5,6,7,8])
val count = countdown(10)
val pair_list = [(1,2), (2,3)]

val l1 = [1,2,3,4]
val l2 = [5,6,7,8,9]

val ap = append(l1, l2)
val pl = sum_pair_list(pair_list);
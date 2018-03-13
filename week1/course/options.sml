(**)
(* fn: int list -> int option *)

fun max1(xs : int list) =
    if null xs
    then NONE
    else
        let val tl_ans = max1(tl xs)
        in
            if
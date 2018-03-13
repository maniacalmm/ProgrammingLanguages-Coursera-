fun rev xs =
    case xs of
        [] => []
        | x :: xs' => (rev xs') @ [x]

fun rev_tail xs =
    let fun aux(xs, acc) =
            case xs of
                [] => []
                | x :: xs' => aux(xs', x::acc)
        in aux(xs, []) end


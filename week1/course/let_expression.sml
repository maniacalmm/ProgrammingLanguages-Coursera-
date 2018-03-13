fun silly1 (z : int) =
    let
        val x = if z > 0 then z else 34
        val y = x + z + 9
        val w = 89
    in
        if x > y
        then x * 2
        else w * w
    end



fun countup_from1 (x : int) =
    let
        fun count(from : int) =
            if from = x
            then from :: []
            else from :: count(from + 1)
    in
        count(1)
    end

fun countdown(x : int) =
    let
        fun count(from : int) =
            if from = 1
            then from :: []
            else from :: count(from - 1)
    in
        count(x)
    end

fun max(xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
        let val tl_ans = max(tl xs)
        in
            if hd xs > tl_ans
            then hd xs
            else tl_ans
        end
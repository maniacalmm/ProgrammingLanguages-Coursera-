fun countup_from1(x : int) =
    let
        fun count(from : int) =
            if from=x
            then x::[]
            else from :: count(from + 1)
    in
        if x < 1
        then []
        else count(1)
    end
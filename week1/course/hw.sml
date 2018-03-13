val months_day = [31,28,31,30,31,30,31,31,30,31,30,31]
val months_name = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]



fun cal_days(date: int*int*int) =
    let
        fun helper(month: int, month_l: int list) =
            if month = 1
            then 0
            else hd month_l + helper(month - 1, tl month_l)
    in
        #1 date * 365 + helper(#2 date, months_day) + #3 date
    end

fun is_older(date1: int*int*int, date2: int*int*int) =
    let
        val day1 = cal_days(date1)
        val day2 = cal_days(date2)
    in
        if day1 < day2
        then true
        else false
    end

fun number_in_month(date_list: (int*int*int) list, month: int) =
    if null date_list
    then 0
    else
        if ((#2 (hd date_list)) = month)
        then 1 + number_in_month(tl date_list, month)
        else number_in_month(tl date_list, month)


fun number_in_months(date_list: (int * int * int) list, months: int list) =
    if null months
    then 0
    else number_in_month(date_list, hd months) + number_in_months(date_list, tl months);


fun dates_in_month(date_list: (int*int*int) list, months: int) =
    if null date_list
    then []
    else
        if ((#2 (hd date_list)) = months)
        then hd date_list :: dates_in_month(tl date_list, months)
        else dates_in_month(tl date_list, months)

fun dates_in_months(date_list: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(date_list, hd months) @ dates_in_months(date_list, tl months)

fun get_nth(sl : string list, nth: int) =
    if nth = 1
    then hd sl
    else get_nth(tl sl, nth - 1)

fun date_to_string(date: int*int*int) =
    List.nth(months_name, #2 date - 1) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

fun number_before_reaching_sum(sum: int, nl: int list) =
    if sum - hd nl <= 0
    then 0
    else 1 + number_before_reaching_sum(sum - hd nl, tl nl)

fun what_month(day: int) =
    number_before_reaching_sum(day, months_day) + 1

fun month_range(day1: int, day2: int) =
    if (day1 > day2)
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(l: (int * int * int) list) =
    if null l
    then NONE
    else
        let
            val old = oldest(tl l);
        in
            if isSome old andalso is_older(valOf old, hd l)
            then old
            else SOME (hd l)
        end
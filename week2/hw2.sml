 (* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for roblem 1 here *)
fun all_except_option (s, lst) =
    case lst of
        [] => NONE
        | x::xs => case same_string(s, x) of
                    true => SOME xs
                    |false => case all_except_option(s, xs) of
                                NONE => NONE
                                |SOME y => SOME(x :: y)

fun get_substitutions1 (llst, s) =
    case llst of
        [] => []
        | x::xs => case all_except_option(s, x) of
                        NONE => get_substitutions1(xs, s)
                        | SOME ls => ls @ get_substitutions1(xs, s)

fun get_substitutions2 (llst, s) =
    let fun helper(llst, s, acc) =
            case llst of
                [] => acc
                | x :: xs => case all_except_option(s, x) of
                                NONE => helper(xs, s, acc)
                                | SOME ls => helper(xs, s, acc @ ls)
    in helper(llst, s, []) end


fun similar_names (dict, name) =
    let fun create_name(names, records, acc) =
            case names of
                [] => acc
                | n :: ns => case records of
                                {first, middle, last} => create_name(ns, records, {first=n, middle=middle, last=last}::acc)
    in
        case name of
            {first, middle, last} => create_name(first :: get_substitutions2(dict, first), name, [])
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color card =
    case card of
        (suit, rank) => case suit of
                         Clubs => Black
                        |Spades => Black
                        |_     => Red

fun card_value card =
    case card of
        (suit, rank) => case rank of
                         Num i => i
                        |Ace => 11
                        |_ => 10

fun remove_card (cards, card, e) =
    case cards of
        [] => raise e
        | c :: cs => case card = c of
                        true => cs
                        |false => c :: remove_card(cs, card, e)

fun all_same_color cards =
    case cards of
        [] => true
        | card :: [] => true
        | c1 :: c2 :: cs => case card_color(c1) = card_color(c2) of
                                true => all_same_color(c2::cs)
                                | false => false

fun sum_cards cards =
    let fun helper (cards, acc) =
            case cards of
                [] => acc
                | c :: cs => helper(cs, card_value(c) + acc)
    in
        helper (cards, 0)
    end

(*fun score(cards, goal) =
    case all_same_color(cards) of
        true => goal
        | false => ~goal*)

fun score (cards, goal) =
    let
        val diff = sum_cards cards - goal
    in
        if diff > 0
        then
            if all_same_color cards
            then diff * 3 div 2
            else diff * 3
        else
            if all_same_color cards
            then ~diff div 2
            else ~diff
    end

(* don't know why the following doesn't work, some type error *)
(*fun officiate (cards, moves, goal) =
    let fun cal (cards, moves, held, goal) =
            case moves of
                [] => score(held, goal)
                | m :: ms => case m of
                                Draw => case cards of
                                            [] => score(held, goal)
                                            |c :: cs =>  case card_value c + sum_cards held of
                                                            ress => if ress > goal
                                                                 then score(c::held, goal)
                                                                 else cal(cs, ms, c :: held, goal)
                                | Discard x => cal(cards, ms, remove_card(held, x, IllegalMove), goal)
    in
        cal(cards, moves, [], goal)
    end*)

fun officiate(cards, moves, goal) =
    let fun cal game_state =
        case game_state of
             (_, [], goal, held) => score(held, goal)
            |([], moves, goal, held) => score(held, goal)
            |(card::cards, move::moves, goal, held) =>
                case move of
                     Discard x => cal(cards, moves, goal, remove_card(held, x, IllegalMove))
                    |Draw => if (card_value card + sum_cards held > goal)
                             then score(card::held, goal)
                             else cal(cards, moves, goal, card::held)
    in
        cal(cards, moves, goal, [])
    end












 (* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2.sml";

val test1 = all_except_option ("string", ["string"]) = SOME []
val test1_1 = all_except_option("haha", ["hehe", "hoho", "haha", "meow"]) = SOME ["hehe", "hoho", "meow"]

val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test2_2 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") =  ["Fredrick","Freddie","F"]
val test2_3 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test3_2 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") =  ["Fredrick","Freddie","F"]
val test3_3 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
        [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
         {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"})


val test5 = card_color (Clubs, Num 2) = Black
val test5_1 = card_color (Hearts, Num 2) = Red

val test6 = card_value (Clubs, Num 2) = 2
val test6_1 = card_value (Clubs, Ace) = 11
val test6_2 = card_value (Clubs, King) = 10

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_1 = remove_card ([(Hearts, Ace),(Spades, King) ,(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Spades, King), (Hearts, Ace)]
val test7_2 = remove_card ([(Hearts, Ace), (Clubs, King) , (Spades, King) ,(Hearts, Ace)], (Clubs, King), IllegalMove)
                        = [(Hearts, Ace), (Spades, King), (Hearts, Ace)]

val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test8_1 = all_same_color [(Hearts, Ace), (Spades, Ace)] = false
val test8_2 = all_same_color [(Hearts, Ace), (Hearts, Ace), (Hearts, King)] = true
val test8_3 = all_same_color [(Hearts, Ace), (Hearts, Ace), (Hearts, King), (Spades, Queen)] = false


val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test9_1 = sum_cards [(Clubs, Num 2),(Clubs, Num 11), (Diamonds, King),(Spades, Ace)] = 34
val test9_2 = sum_cards [] = 0

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_1 = score ([(Hearts, Num 2),(Hearts, Num 4)],10) = 2
val test10_2 = score ([(Hearts, Num 2),(Clubs, Ace)],10) = 9
val test10_2_1 = score ([(Hearts, Num 2),(Hearts, Ace)],10) = 4

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)


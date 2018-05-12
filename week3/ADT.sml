(* this is a record *)
datatype set = S of {  insert : int -> set,
                       member : int -> bool,
                       size   : unit -> int }


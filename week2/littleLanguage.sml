datatype exp =
    Constant of int
    | Negate of exp
    | Add    of exp * exp
    | Multiply of exp * exp
    | Substract of exp * exp


fun eval e =
    case e of
        Constant i          => i
      | Negate e2           => ~(eval e2)
      | Add (e1, e2)        => (eval e1) + (eval e2)
      | Multiply(e1, e2)    => (eval e1) * (eval e2)
      | Substract(e1, e2)   => (eval e1) - (eval e2)

val x = Substract(Add(Constant 2, Constant 20), Multiply(Constant 543, Add(Constant 984, Constant 809)))

fun max_constant(e: exp) =
    case e of
        Constant i => i
      | Negate e2 => max_constant e2
      | Add(e1, e2) =>
            Int.max(max_constant e1, max_constant e2)
      | Multiply(e1, e2) =>
            Int.max(max_constant e1, max_constant e2)
      | Substract(e1, e2) =>
            Int.max(max_constant e1, max_constant e2)

val max = max_constant x
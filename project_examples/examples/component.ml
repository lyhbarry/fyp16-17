open GMain

type orientation = Vertical | Horizontal

type msg = Increment | Decrement | DoubleIncr | DoubleDecr | Square | Reset

type components =
| Window of int * int * string
| Button of msg * string
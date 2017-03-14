open Ulmus
open Component

(* Counter Example *)
(* type msg = Increment | Decrement | DoubleIncr | DoubleDecr | Square *)


(* MODEL *)
let model = ref 0


(* VIEW *)
let view =
  [	[ Window (320, 240, "Hello") ]
  ; [ Button (Increment, "+"); Button (Decrement, "-") ]
  ; [ Button (DoubleIncr, "++"); Button (DoubleDecr, "--") ]
  ; [ Button (Square, "**"); Button (Reset, "Reset") ]
  ]


(* UPDATE *)
let update msg model =
  match msg with
  | Increment ->
  	  model + 1
  | Decrement ->
  	  model - 1
  | DoubleIncr ->
  	  model + 2
  | DoubleDecr ->
  	  model - 2
  | Square ->
  	  model * model
  | Reset ->
  	  0


(* Excecute program *)
(* TODO: Build records *)
let () =
  Ulmus.main model view update

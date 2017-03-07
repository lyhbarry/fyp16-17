open Ulmus

(* Counter Example *)

(* MODEL *)
let model = ref 0

(* VIEW *)
(* TODO: Build records for View *)
let view = ["+"; "-"; "++"; "--"; "**"]

(* UPDATE *)
type msg = Increment | Decrement | DoubleIncr | DoubleDecr | Square

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

let var = [Increment; Decrement; DoubleIncr; DoubleDecr; Square]

(* Excecute program *)
let () =
  Ulmus.main model view update var ~title:"Button" ~width: 480 ~height: 360

open Mvclablgtk

(* Counter Example *)

(* MODEL *)
let model = ref 0

(* VIEW *)
let view = ["+"; "-"]

(* UPDATE *)
type msg = Increment | Decrement

let update msg model =
  match msg with
  | Increment -> model + 1
  | Decrement -> model - 1

let var = [Increment; Decrement]

(* Excecute program *)
let () =
  Mvclablgtk.main (model, view, update, var)

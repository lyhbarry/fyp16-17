open Ulmus

(* Field Example *)

(* MODEL *)
let model = "Insert text here"

(* VIEW *)
let view = ["Upper"; "Lower"; "Cap"; "Uncap"]

(* UPDATE *)
type msg = ToUpper | ToLower | Capitalize | Uncapitalize

let update msg model =
  match msg with
  | ToUpper ->
  	  String.uppercase_ascii(model)
  | ToLower ->
  	  String.lowercase_ascii(model)
  | Capitalize ->
  	  String.capitalize_ascii(model)
  | Uncapitalize ->
  	  String.uncapitalize_ascii(model)

let var = [ToUpper; ToLower; Capitalize; Uncapitalize]

(* Excecute program *)
let () =
  Ulmus.main_field model view update var

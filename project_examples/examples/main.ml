open Mvclablgtk

(* Counter Example *)
(* MODEL *)
(* let model = ref 0 *)
let model = ref 0

(* UPDATE *)
(* Use OCaml variants *)
let update =
	[(fun x -> x + 1); (fun x -> x - 1)]

(* VIEW *)
(*
	TODO: Build records with key as components and value as view
	Example: {button: "+"} or with Variants
*)
let view =
	["+"; "-"]

(* Excecute program *)
let () =
  Mvclablgtk.main_int (model, view, update)


(* (* Field Example *)
(* MODEL *)
(* let model = ref 0 *)
let model = ref 0

(* UPDATE *)
(* Use OCaml variants *)
let update =
	[(fun x -> String.uppercase_ascii(x)); (fun x -> String.lowercase_ascii(x))]

(* VIEW *)
let view =
	["Upper"; "Lower"]

(* Excecute program *)
let () =
  Mvclablgtk.main_field (model, view, update) *)


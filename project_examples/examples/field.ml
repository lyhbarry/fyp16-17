open Mvclablgtk

(* Field Example *)
(* MODEL *)
(* let model = ref 0 *)
let model = ref 0

(* UPDATE *)
(* Use OCaml variants *)
let update =
	[(fun x -> String.uppercase_ascii(x));
	 (fun x -> String.lowercase_ascii(x))]

(* VIEW *)
let view =
	["Upper"; "Lower"]

(* Excecute program *)
let () =
  Mvclablgtk.main_field (model, view, update)

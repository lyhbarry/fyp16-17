module type X_int = sig val x : int end

module Three : X_int = struct let x = 3 end

let main () =
	print_endline (string_of_int Three.x)

let () = main ()
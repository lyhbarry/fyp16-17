open GMain
open GdkKeysyms

let app_window width height title =
	GWindow.window ~width:width ~height:height
        	       				~title:title 
(*     let vbox = GPack.vbox ~packing:window#add () in
	window#connect#destroy ~callback:Main.quit;

	(* Menu bar *)
	let menubar = GMenu.menu_bar ~packing:vbox#pack () in
	let factory = new GMenu.factory menubar in
	let accel_group = factory#accel_group in
	let file_menu = factory#add_submenu "File" in

	(* File menu *)
	let factory = new GMenu.factory file_menu ~accel_group in
	factory#add_item "Quit" ~key:_Q ~callback: Main.quit; *)

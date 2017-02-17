open GMain
open GdkKeysyms

let locale = GtkMain.Main.init ()

let count = ref 0

let main () =
  let window = GWindow.window ~width:320 ~height:240
                              ~title:"Simple lablgtk program" () in
  let vbox = GPack.vbox ~packing:window#add () in
  window#connect#destroy ~callback:Main.quit;

  (* Menu bar *)
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "File" in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Quit" ~key:_Q ~callback: Main.quit;

  (* add text view with scroll bars *)
  let scroll = GBin.scrolled_window
               ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC
               ~packing:vbox#add () in
  let textview = GText.view ~packing:scroll#add_with_viewport () in
  (* set text *)
  textview#buffer#set_text "Insert text here";

  (* Button *)
  let add_button = GButton.button ~label:"+"
                              ~packing:vbox#add () in
  add_button#connect#clicked ~callback: (fun () -> count := !count + 1; prerr_endline (string_of_int(!count)));

  let minus_button = GButton.button ~label:"-"
                              ~packing:vbox#add () in 
  minus_button#connect#clicked ~callback: (fun () -> count := !count - 1; prerr_endline (string_of_int(!count)));

  let minus_button = GButton.toggle_button ~label:"Toggle"
                              ~packing:vbox#add () in 
  minus_button#connect#clicked ~callback: (fun () -> prerr_endline "Toggled!");  

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()

let () = main ()
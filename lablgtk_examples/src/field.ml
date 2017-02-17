open GMain
open GdkKeysyms

let locale = GtkMain.Main.init ()

let main () =
  let window = GWindow.window ~width:320 ~height:240
                              ~title:"Field Example" () in
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

  (* Text input *)
  let text_input = GEdit.entry
                   ~packing:vbox#add () in

  (* Text output display *)
  let scroll = GBin.scrolled_window
             ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC
             ~packing:vbox#add () in
  let textview = GText.view ~packing:scroll#add_with_viewport () in

  (* Button *)
  let uppercase_button = GButton.button ~label:"Upper"
                                  ~packing:vbox#add () in
  uppercase_button#connect#clicked ~callback: (fun () -> let op = String.uppercase_ascii(text_input#text) in
    textview#buffer#set_text op);

  let lowercase_button = GButton.button ~label:"Lower"
                                  ~packing:vbox#add () in
  lowercase_button#connect#clicked ~callback: (fun () -> let op = String.lowercase_ascii(text_input#text) in
    textview#buffer#set_text op);

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()

let () = main ()

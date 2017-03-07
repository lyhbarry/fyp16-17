open GMain
open GdkKeysyms

let locale = GtkMain.Main.init ()


(* Start of Main for Button example *)

let add_button vbox component model view update msg =
  (* Buttons *)
  let button = GButton.button ~label:view
                              ~packing:vbox#add () in
	button#connect#clicked ~callback: (fun () ->
  model := update msg !model;
  component#buffer#set_text (string_of_int(!model)));;


let build_view vbox model view update var =
  (* Text display *)
  let scroll = GBin.scrolled_window
               ~hpolicy:`AUTOMATIC
               ~vpolicy:`AUTOMATIC
               ~packing:vbox#add () in
  let component = GText.view ~packing:scroll#add_with_viewport () in
  component#buffer#set_text (string_of_int(!model));

  for i = 0 to ((List.length view) - 1) do
    add_button vbox component model (List.nth view i) update (List.nth var i)
  done;;


let main ?(width=320) ?(height=240) ?(title="Default") model view update var =
  let window = GWindow.window ~width:width ~height:height
                              ~title:title () in
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

  build_view vbox model view update var;

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()


(* Start of Main for field example *)

let field_button (vbox, text_input, textview, model, view, update, msg) =
  (* Button *)
  let uppercase_button = GButton.button ~label:view
                                        ~packing:vbox#add () in
  uppercase_button#connect#clicked ~callback: (fun () ->
  let model = update msg text_input#text in
  textview#buffer#set_text model);;


let msg_field vbox model view update var =
  (* Text input *)
  let text_input = GEdit.entry
                   ~packing:vbox#add ()
                   ~text: model in

  (* Text output display *)
  let scroll = GBin.scrolled_window
             ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC
             ~packing:vbox#add () in
  let textview = GText.view ~packing:scroll#add_with_viewport () in

  for i = 0 to ((List.length view) - 1) do
    field_button (vbox, text_input, textview, model, (List.nth view i), update, (List.nth var i))
  done;;


let main_field model view update var =
  let window = GWindow.window ~width:320 ~height:240
                              ~title:"Example" () in
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

  msg_field vbox model view update var;

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()

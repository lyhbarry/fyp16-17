open GMain
open GdkKeysyms
open List

let locale = GtkMain.Main.init ()


let button (vbox, component, model, view, update) =
  (* Button *)
  let add_button = GButton.button ~label:view
                                  ~packing:vbox#add () in
  	add_button#connect#clicked ~callback: (fun () ->
  	  model := update !model;
      component#buffer#set_text (string_of_int(!model)));;


(* View *)
let msg (vbox, model, view, update) =
  (* Text display *)
  let scroll = GBin.scrolled_window
             ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC
             ~packing:vbox#add () in
  let component = GText.view ~packing:scroll#add_with_viewport () in
  component#buffer#set_text (string_of_int(!model));

  (* TODO: Iterate records to build components *)
  button(vbox, component, model, (List.nth view 0), (List.nth update 0));
  button(vbox, component, model, (List.nth view 1), (List.nth update 1));;


let main_int (model, view, update) =
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

  msg(vbox, model, view, update);

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()


let msg_field (vbox, model, view, update) =
  (* Text input *)
  let text_input = GEdit.entry
                   ~packing:vbox#add () in

  (* Text output display *)
  let scroll = GBin.scrolled_window
             ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC
             ~packing:vbox#add () in
  let textview = GText.view ~packing:scroll#add_with_viewport () in

  (* Button *)
  let uppercase_button = GButton.button ~label:(List.nth view 0)                                  ~packing:vbox#add () in
  uppercase_button#connect#clicked ~callback: (fun () -> let op = (List.nth update 0) text_input#text in
    textview#buffer#set_text op);

  let lowercase_button = GButton.button ~label:(List.nth view 1)
                                  ~packing:vbox#add () in
  lowercase_button#connect#clicked ~callback: (fun () -> let op = (List.nth update 1) text_input#text in
    textview#buffer#set_text op);;


let main_field (model, view, update) =
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

  msg_field(vbox, model, view, update);

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()

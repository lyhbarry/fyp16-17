open Component

open GMain
open GdkKeysyms

let locale = GtkMain.Main.init ()


let build_window ?(width=320) ?(height=240) ?(title="Default") =
  GWindow.window ~width:width ~height:height ~title:title ();;


let build_box orientation packing =
  if orientation = Vertical then
    GPack.vbox ~packing:packing#add ()
  else
    GPack.hbox ~packing:packing#add ();;


let build_menu packing =
  (* Menu bar *)
  let menubar = GMenu.menu_bar ~packing:packing#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "File" in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Quit" ~key:_Q ~callback: Main.quit;;


let add_scroll packing =
  GBin.scrolled_window ~hpolicy:`AUTOMATIC
                       ~vpolicy:`AUTOMATIC
                       ~packing:packing#add ();;


let build_view_display scroll model =
  GText.view ~packing:scroll#add_with_viewport ();;


let init_text text_view model =
  text_view#buffer#set_text (string_of_int(!model));;


let add_button packing component model label update msg =
  (* Buttons *)
  let button = GButton.button ~label:label
                              ~packing:packing#add () in
  button#connect#clicked ~callback: (fun () ->
    model := update msg !model;
  component#buffer#set_text (string_of_int(!model)));;


let main model view update =
  (* Parse structure and build view *)

  (* Window *)
  let Window (width, height, title) = List.nth (List.nth view 0) 0 in
  let window = build_window ~width:width ~height:height ~title:title in

  (* Vertical box *)
  let main_box = build_box Vertical window in
    window#connect#destroy ~callback:Main.quit;

  (* Build Menu *)
(*   let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "File" in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Quit" ~key:_Q ~callback: Main.quit;
 *)

  (* Text View *)
  let scroll = add_scroll main_box in
  let text_view = build_view_display scroll model in
    init_text text_view model;

  (* Buttons *)
  let box = build_box Vertical main_box in
  for i = 1 to ((List.length view) - 1) do
    let box = build_box Horizontal box in
    for j = 0 to ((List.length (List.nth view i)) - 1) do
      let Button (msg, label) = List.nth (List.nth view i) j in
      add_button box text_view model label update msg
    done
  done;

  (* Display the windows and enter Gtk+ main loop *)
  (* window#add_accel_group accel_group; *)
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


(* Old button functions *)
(*
let add_button vbox component model view update msg hbox =
  (* Buttons *)
  let vbox = build_box Vertical hbox in
  let button = GButton.button ~label:view
                              ~packing:vbox#add () in
  button#connect#clicked ~callback: (fun () ->
  model := update msg !model;
  component#buffer#set_text (string_of_int(!model)));;


let build_view vbox model view update var hbox =
  Text display
  let scroll = GBin.scrolled_window
               ~hpolicy:`AUTOMATIC
               ~vpolicy:`AUTOMATIC
               ~packing:vbox#add () in
  let component = GText.view ~packing:scroll#add_with_viewport () in
  component#buffer#set_text (string_of_int(!model));;

  for i = 0 to ((List.length view) - 1) do
    add_button vbox component model (List.nth view i) update (List.nth var i) hbox
  done; *)

#! /bin/bash
ocamlfind ocamlopt -c -package lablgtk2 -linkpkg  ulmus.ml
# ocamlfind ocamlopt -c -package lablgtk2 -linkpkg button.ml
# ocamlfind ocamlc -g -package lablgtk2 -linkpkg ulmus.ml button.ml -o test
ocamlfind ocamlopt -c -package lablgtk2 -linkpkg field.ml
ocamlfind ocamlc -g -package lablgtk2 -linkpkg ulmus.ml field.ml -o test
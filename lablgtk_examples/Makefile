default: main

main: counter_2.native

%.native:
	ocamlbuild -use-ocamlfind $@
	mv $@ $*
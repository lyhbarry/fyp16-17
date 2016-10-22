# Content
## Lablgtk Examples
To compile lablgtk examples use the following command below:

`ocamlfind ocamlc -g -package lablgtk2 -linkpkg example.ml -o example`

The following is a list of all 'lablgtk' examples:
* example
  * Example OCaml lablgtk program with button widget
* counter_1
  * Counter application which displays count to terminal
* counter_2
  * Counter application with in-app display for count
* field
  * Application that allows text in field to be uppercased or lowercased
  
## OCaml Examples
### Modules
To compile modules examples use the following commands below:

```
ocamlopt -c <First module filename>`
ocamlopt -c <Second module filename>`
ocamlopt -o <Name of executable> <First module .cmx file> <Second module .cmx file>
```

For example, to compile our "hello" executable:

```
ocamlopt -c amodule.ml
ocamlopt -c bmodule.ml
ocamlopt -o hello amodule.cmx bmodule.cmx
```

The following is the list of all 'modules' examples:
* Hello with modules
 * Build a hello executable with 2 modules (amodule.ml, bmodule.ml)
* Open module
 * Demonstrate how `open` is used to access a module (amodule.ml, cmodule.ml)
* Interfaces and Signatures
 * Masking of interfaces with a .mli file (moduleMasking.ml, moduleMasking.mli)
 

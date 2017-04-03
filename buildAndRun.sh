ocamlfind ocamlc -linkpkg -thread -package lambdasoup,core,cohttp,lwt,cohttp.lwt meals.ml -o meals.byte && ./meals.byte

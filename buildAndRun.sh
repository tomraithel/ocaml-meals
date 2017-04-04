ocamlfind ocamlc -linkpkg -thread -package lambdasoup,core,cohttp,lwt,cohttp.lwt formatter.ml meals.ml -o meals.byte && ./meals.byte

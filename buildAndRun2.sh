ocamlfind ocamlc -linkpkg -thread -package lambdasoup,core,cohttp,lwt,cohttp.lwt coclient.ml -o coclient.byte && ./coclient.byte

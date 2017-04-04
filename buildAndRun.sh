ocamlfind ocamlc\
  -linkpkg\
  -thread\
  -package lambdasoup,core,cohttp,lwt,cohttp.lwt\
  -o meals.byte\
  menu.ml formatter.ml meals.ml\
  \
  && ./meals.byte

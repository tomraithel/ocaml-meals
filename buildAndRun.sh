ocamlfind ocamlopt\
  -linkpkg\
  -thread\
  -package lambdasoup,core,cohttp,lwt,cohttp.lwt\
  -o meals\
  menu.ml formatter.ml meals.ml\
  \
  && ./meals

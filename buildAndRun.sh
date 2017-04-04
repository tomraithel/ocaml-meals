ocamlfind ocamlc\
  -linkpkg\
  -thread\
  -package lambdasoup,core,cohttp,lwt,cohttp.lwt\
  -o meals.byte\
  formatter.ml meals.ml\
  \
  && ./meals.byte

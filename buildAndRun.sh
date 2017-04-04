ocamlfind ocamlc\
  -linkpkg\
  -thread\
  -package lambdasoup,core,cohttp,lwt,cohttp.lwt\
  -o meals.byte\
  -i formatter.mli\
  formatter.ml meals.ml\
  \
  && ./meals.byte

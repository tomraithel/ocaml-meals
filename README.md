```
$ opam install lambdasoup cohttp lwt js_of_ocaml
```

~/.ocamlinit

```
#use "topfind";;
#thread;;
#camlp4o;;
#require "cohttp";;
#require "cohttp.lwt";;
#require "core.top";;
#require "core.syntax";;
```


```
open Soup

let soup = read_channel stdin |> parse in

(* Print the page title. *)
soup $ "title" |> R.leaf_text |> print_endline;

(* Print the targets of all links. *)
soup $$ "a[href]"
|> iter (fun a -> print_endline (R.attribute "href" a));

(* Find the first unordered list. *)
let ul = soup $ "ul" in

(* Print the contents of all its items. *)
ul $$ "li"
|> iter (fun li ->
  trimmed_texts li |> String.concat "" |> print_endline)

(* Find all subsequent sibling elements of the same list. *)
let _ = ul $$ "~ *" in

(* Find all previous sibling elements instead. *)
let _ = ul |> previous_siblings |> elements in

(* ... *)
```

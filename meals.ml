open Soup;;
open Core.Std;;

let get_meals soup =
  soup $$ ".meal"
;;

let get_meal_title meal =
  meal $ ".title" |> R.leaf_text
;;

let get_titles filename =
  let soup = read_file filename |> parse in
  let meals_list = to_list (get_meals soup) in
  let titles = List.map ~f:get_meal_title meals_list in
  String.concat ~sep:"+" titles
;;

print_endline (get_titles "./index.html");;

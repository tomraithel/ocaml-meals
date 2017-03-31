open Soup;;
open Core.Std;;

type day = {
  name: string;
};;

let get_meals soup =
  soup $$ ".meal"
;;

let get_meal_titles meal =
  let titles = meal $$ ".meal-row .title" in
  let titles_list = to_list titles in
  let titles_string_list = List.map ~f:R.leaf_text titles_list in
  String.concat ~sep:"+" titles_string_list
;;

let get_meal_day meal =
  meal $ ".week-day span" |> R.leaf_text
;;

let get_day meal =
  (
    get_meal_day meal,
    get_meal_titles meal
  )
;;

let get_titles filename =
  let soup = read_file filename |> parse in
  let meals_list = to_list (get_meals soup) in
  let titles = List.map ~f:get_day meals_list in
  String.concat ~sep:"+" (List.map ~f:(fun (day, title) -> day ^ title) titles)
;;

print_endline (get_titles "./index.html");;

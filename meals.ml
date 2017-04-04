open Soup
open Core.Std
open Lwt
open Cohttp
open Cohttp_lwt_unix

let fetch_html =
  Client.get (Uri.of_string "https://meals.aoe.com/") >>=
    fun (resp, body) ->
      body
        |> Cohttp_lwt_body.to_string >|= fun body ->
          body
;;

let trimmed_leaf_text node =
  node
  |> R.leaf_text
  |> String.strip
;;

let get_meals soup =
  soup $$ ".meal"
;;

let get_meal_titles meal =
  meal
    |> select ".meal-row .title"
    |> to_list
    |> List.map ~f:trimmed_leaf_text
;;

let get_meal_day meal =
  meal $ ".week-day span" |> trimmed_leaf_text
;;

let get_day meal =
  (
    get_meal_day meal,
    get_meal_titles meal
  )
;;

let get_menu body =
  body
    |> parse
    |> get_meals
    |> to_list
    |> List.map ~f:get_day
;;

let render_titles titles = String.concat ~sep:"\n - " titles;;

let render menu =
  String.concat ~sep:"\n-------\n" (List.map ~f:(fun (day, titles) -> day ^ (render_titles titles)) menu)
;;

let () =
  let body = Lwt_main.run fetch_html in
  get_menu body |> render |> print_endline

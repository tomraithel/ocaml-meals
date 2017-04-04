open Soup
open Core.Std
open Lwt
open Cohttp
open Cohttp_lwt_unix
open Formatter
open Menu

let fetch_html =
  let headers = Header.of_list ["Accept-Language", "de-DE"] in
  Client.get (Uri.of_string "https://meals.aoe.com/") ~headers >>=
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
  {
    day = get_meal_day meal;
    titles = get_meal_titles meal;
  }
;;

let get_week soup =
  soup $ ".week:first-child .sub"
    |> trimmed_leaf_text
    |> String.split ~on:'\n'
    |> List.map ~f:String.strip
    |> String.concat ~sep:" "
;;

let get_meals soup =
  let l = soup $$ ".week:first-child .meal"
    |> to_list
    |> List.map ~f:get_day in
  match l with
    | [] -> None
    | _ -> Some({ week = get_week soup; meals = l })
;;

let get_menu body =
  body
    |> parse
    |> get_meals
;;

let () =
  let body = Lwt_main.run fetch_html in
  get_menu body
    |> render_menu
    |> print_endline

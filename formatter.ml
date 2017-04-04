open Core.Std
open Menu

let render_title title =
  " - " ^ title ^ "\n"
;;

let render_titles titles =
  titles
    |> List.map ~f:render_title
    |> String.concat
;;

let render_meal {day; titles} =
  day ^ ": \n" ^ (render_titles titles)
;;

let render_menu menu =
  match menu with
    | None -> "❌  Leider kein Essen für diese Woche hinterlegt."
    | Some m ->
      let menu_str = m.meals
        |> List.map ~f:render_meal
        |> String.concat ~sep:"---------------------------------------\n"
      in
      "\n"
      ^ "====== 🍲  Diese Woche bei AOE 🍲  ======\n"
      ^ "      ~ " ^ m.week ^ " ~ \n"
      ^ "=======================================\n"
      ^ menu_str
      ^ "======================================="
;;

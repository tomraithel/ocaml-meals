open Core.Std

let render_title title =
  "- " ^ title ^ "\n"
;;

let render_titles titles =
  titles
    |> List.map ~f:render_title
    |> String.concat
;;

let render_entry (day, titles) =
  "🍲  " ^ day ^ ": \n" ^ (render_titles titles)
;;

let render_menu menu =
  menu
    |> List.map ~f:render_entry
    |> String.concat ~sep:"----------------------------------------\n"
;;

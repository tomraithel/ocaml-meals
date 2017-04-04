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
  match menu with
    | None -> "❌  Leider kein Essen für diese Woche hinterlegt."
    | Some m ->
      m
        |> List.map ~f:render_entry
        |> String.concat ~sep:"----------------------------------------\n"
;;

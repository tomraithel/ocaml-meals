open Core.Std

let render_titles titles = String.concat ~sep:"\n - " titles;;

let render_entry (day, titles) = day ^ ": " ^ (render_titles titles);;

let render_menu menu =
  menu
    |> List.map ~f:render_entry
    |> String.concat ~sep:"\n-------\n"
;;

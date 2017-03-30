open Soup;;

let get_title filename =
  let soup = read_file filename |> parse in
  let title = soup $ "title" |> leaf_text in
  match title with
    | Some x -> x
    | None -> "---"
;;

print_endline (get_title "./index.html");;

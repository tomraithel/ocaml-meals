open Core.Std

(** Contains the menu data *)
type t

(** Transform the menu into a nicely readable string *)
val render_menu : t -> string

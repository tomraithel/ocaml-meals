open Core.Std

let spec =
  let open Command.Spec in
  empty
;;

let command =
  Command.basic
    ~summary: "Print out the AOE meals menu"
    Command.Spec.(
      empty
      +> flag "-n" no_arg ~doc:" Show meals for next week (if already available)"
    )
    (
      fun is_next () -> Meals.print_meal is_next
    )

let () = Command.run ~version:"1.0.0" ~build_info:"Made with ❤️  by @tomraithel" command

open! Oxbow_ipc

let body_term =
  let open Cmdliner.Term.Syntax in
  let+ mode = Ctl_cli.mode_flag
  and+ all = Ctl_cli.all_flag
  and+ keybind = Ctl_cli.keybind_arg_opt in
  if all
  then Request.Body.Keymap (Unbind_all { mode }), None
  else (
    match keybind with
    | Some keybind -> Request.Body.Keymap (Unbind { keybind; mode }), None
    | None -> failwith "foo")
;;

let name = "unbind"
let doc = "Unbind the given KEYBIND"
let cmd = Ctl_cli.cmd ~name ~doc body_term

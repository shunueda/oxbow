open! Ppx_yojson_conv_lib.Yojson_conv

type t =
  | Bind of
      { keybind : string
      ; command : Command.t
      ; mode : string option
      } [@name "bind"]
  | Unbind of
      { keybind : string
      ; mode : string option
      } [@name "unbind"]
  | Unbind_all of { mode : string option } [@name "unbind-all"]
[@@deriving yojson]

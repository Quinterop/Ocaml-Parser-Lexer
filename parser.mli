
(* The type of tokens. *)

type token = 
  | TRANSITIONS
  | SYMBOL of (Ast.lettre)
  | STATES
  | STACKSYMBOLS
  | SEMICOLON
  | RPARE
  | LPARE
  | INPUTSYMBOLS
  | INITIALSTATE
  | INITIALSTACK
  | EOF
  | COMMA

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val axiome: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.automate)

(* le module d'analyse lexicale *)

(* fontion pour demander le jeton suivant *)
val next_token: Lexing.lexbuf -> Token.token

(* cas d'une erreur lexicale *)
exception Lexing_error of string
type lettre = char 

(* %token <char> TOKEN_LIGNE *)



type nonemptystack = 
| Lettre of lettre
| Suite of lettre * nonemptystack

type stack =
| Vide of unit
| Nonempty of nonemptystack

type lettreOuVide =
| Vide of unit
| Lettre of lettre

type transition = lettre * lettreOuVide * lettre * lettre * stack

type transList = 
| Vide of unit
| Suite of transition * transList (*PAS SUR*)

(*type transitions = PAS COMPRIS *)
(* type transitions = transitions: transList *)

type suitelettresNonvide = 
| Lettre of lettre
| Suite of suitelettresNonvide * lettre

(*
— initialstate → initial state: lettre
— initialstack → initial stack symbol: lettre 
— states → states: suitelettres-nonvide
— inputsymbols → input symbols: suitelettres-nonvide
— stacksymbols → stack symbols: suitelettres-nonvide   TJRS PAS COMPRIS LES ":"
*)

type automate = declarations * transitions 

type declarations = inputsymbols * stacksymbols * states * initialstate * initialstack 

let syntaxCheck entree = 
  (*FONCTION TODO*)
  true 
;;

(*exemple cours 2*)
let ch = open_in (Sys.argv.(1)) in
let lb = Lexing.from_channel ch in
try
  while true do
    let t = Lexer.next_token lb
  in
  Printf.printf "%s \n" (Token.to_string t);
  if t=Token.EOF then exit 0
  done
with
Arith.Lexing_errors ->
Printf.printf " Unexpected character: %s \n" s







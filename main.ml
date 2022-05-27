open Parser
open Lexer

let lexbuf = Lexing.from_channel (open_in (Sys.argv.(1)))

let auto = Parser.axiome Lexer.next_token lexbuf

let rec printcharlist l =
  match l with
  |[] ->  ()
  |(a::l) -> print_char a; printcharlist l
;;




let transitions b = 
  match b with
  |(a,Some (g),c,d,Some (e)) -> print_char a ; print_char g ; print_char c ;print_char d; printcharlist e
  |(a,None,c,d,None) -> print_char a ; print_char c ;print_char d
  |(a,Some (g),c,d,None) -> print_char a ; print_char g ; print_char c ;print_char d; 
  |(a,None,c,d,Some(e)) -> print_char a ; print_char c ;print_char d; printcharlist e
;;

let declarations a =
  match a with
  (b,c,d,e,f) ->print_string "input symbols : "; printcharlist b;print_string "\nstack symbols :"; printcharlist c; print_string "\nstates :"; printcharlist d ; print_char e ; print_char f; print_newline()
;;

let rec translists b =
match b with
|[] ->  ()
|(a::l) -> transitions a ;print_newline ();translists l

let testauto auto = 
  match auto with
  |(a,b) -> declarations a; translists b
;;





testauto auto

(*
  let ch = open_in (Sys.argv.(1)) in
  let lb = Lexing.from_channel ch in
  try
    while true do
      let t = Lexer.next_token lb
    in
    Printf.printf "%s \n" (Token.to_string t);
    if t=Token.EOF then exit 0
    done
with _ ->
  Printf.printf "Erreur lexicale\n"
;;



let tryWord word automat = 
  match automat with
  |(a,b) -> let decla = a in
  match b with
  | Vide() -> failwith "pas de transition"
  | Suite(t,l) -> let (a,b,c,d,e) = t in if 
    
  
  
  
  
  
  let lexbuf = Lexing.from_channel stdin 
  
  let ast = Parser.input Lexer.main lexbuf 
  
  let _ = Printf.printf "Parse:\n%s\n" (Ast.as_string ast)
  
  *)
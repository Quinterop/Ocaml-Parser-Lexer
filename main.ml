open Parser
open Lexer

let lexbuf = Lexing.from_channel (open_in (Sys.argv.(1)))

let auto = Parser.axiome Lexer.next_token lexbuf

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
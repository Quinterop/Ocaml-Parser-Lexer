open Parser
open Lexer
open List

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
  (b,c,d,e,f) ->print_string "input symbols : "; printcharlist b;print_string   "\nstack symbols :"; printcharlist c; print_string "\nstates :"; printcharlist d ;print_string  "\n initial states :"; print_char e ;print_string "\n initial stack :"; print_char f; print_newline()
;;

let rec translists b =
  match b with
  |[] ->  ()
  |(a::l) -> transitions a ;print_newline ();translists l
  
  let testauto auto = 
    match auto with
    |(a,b) -> declarations a; print_string "\ntransitions\n"; translists b
  ;;
;;
testauto auto

let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
    exp (String.length s - 1) []
  ;;
  
  
  let rec instack (inner : char list) (outer:char list) = 
    if List.tl inner = List.hd outer then true else false
  ;;
(*MARCHE QUE SI INNER.SIZE = 1
   FIX*)
  
  
  
  let rec step state letters stack translist = 
    match letters with
    |[] -> print_string "mot vide"; print_newline(); true
    |x::y -> 
      match translist with
      |[] -> print_string "no transition"; false
      |(b::l) -> let (c,d,e,f,g) = b in
      if c = state then(
        if d = x then(
          if instack e stack then ((*TESTER LSTE*)        
            print_string "transition possible"; 
      let stack2 =  stack in (*RETIRER e *)
      step f y (stack2@g) l;
      )else false
      )else false
      )else false
    ;;
    
    
    
    let testword2 auto word= 
    let decla,transL = auto in
    let (a,b,c,d,e) = decla in
    let state =d in
    let stack = e in
    let charlist = explode word in
   step state charlist stack transL
    ;;
      
      
      
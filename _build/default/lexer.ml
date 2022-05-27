# 1 "lexer.mll"
 
open Token
exception Error of string
exception Lexing_error of string

# 8 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\242\255\243\255\002\000\245\255\009\000\008\000\015\000\
    \252\255\253\255\254\255\255\255\021\000\011\000\011\000\013\000\
    \001\000\015\000\010\000\023\000\036\000\024\000\028\000\022\000\
    \000\000\251\255\033\000\042\000\032\000\003\000\026\000\026\000\
    \046\000\045\000\038\000\045\000\002\000\248\255\003\000\247\255\
    \050\000\049\000\048\000\043\000\004\000\036\000\031\000\044\000\
    \056\000\044\000\048\000\042\000\004\000\250\255\043\000\005\000\
    \249\255\062\000\050\000\047\000\058\000\048\000\061\000\056\000\
    \058\000\054\000\006\000\246\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\011\000\255\255\010\000\010\000\010\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\255\255\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\003\000\003\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\017\000\003\000\030\000\045\000\000\000\000\000\000\000\
    \011\000\010\000\000\000\000\000\009\000\000\000\000\000\000\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\025\000\008\000\037\000\039\000\053\000\056\000\
    \067\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\007\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\006\000\005\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\057\000\040\000\012\000\013\000\026\000\
    \015\000\016\000\018\000\019\000\020\000\014\000\021\000\022\000\
    \023\000\024\000\027\000\028\000\029\000\031\000\032\000\033\000\
    \034\000\038\000\036\000\041\000\043\000\054\000\044\000\046\000\
    \047\000\048\000\049\000\050\000\051\000\052\000\055\000\058\000\
    \059\000\035\000\060\000\061\000\062\000\042\000\063\000\064\000\
    \065\000\066\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\016\000\003\000\029\000\044\000\255\255\255\255\255\255\
    \000\000\000\000\255\255\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\024\000\000\000\036\000\038\000\052\000\055\000\
    \066\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\005\000\006\000\007\000\012\000\013\000\
    \014\000\015\000\017\000\018\000\019\000\012\000\020\000\021\000\
    \022\000\023\000\026\000\027\000\028\000\030\000\031\000\032\000\
    \033\000\034\000\035\000\040\000\041\000\042\000\043\000\045\000\
    \046\000\047\000\048\000\049\000\050\000\051\000\054\000\057\000\
    \058\000\033\000\059\000\060\000\061\000\041\000\062\000\063\000\
    \064\000\065\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec next_token lexbuf =
   __ocaml_lex_next_token_rec lexbuf 0
and __ocaml_lex_next_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 12 "lexer.mll"
     (LPARE)
# 143 "lexer.ml"

  | 1 ->
# 13 "lexer.mll"
     (RPARE)
# 148 "lexer.ml"

  | 2 ->
# 14 "lexer.mll"
     (COMMA)
# 153 "lexer.ml"

  | 3 ->
# 15 "lexer.mll"
     (SEMICOLON)
# 158 "lexer.ml"

  | 4 ->
# 16 "lexer.mll"
                  (INPUTSYMBOLS)
# 163 "lexer.ml"

  | 5 ->
# 17 "lexer.mll"
                  (STACKSYMBOLS)
# 168 "lexer.ml"

  | 6 ->
# 18 "lexer.mll"
           (STATES)
# 173 "lexer.ml"

  | 7 ->
# 19 "lexer.mll"
                  (INITIALSTATE)
# 178 "lexer.ml"

  | 8 ->
# 20 "lexer.mll"
                  (INITIALSTACK)
# 183 "lexer.ml"

  | 9 ->
# 21 "lexer.mll"
                (TRANSITIONS)
# 188 "lexer.ml"

  | 10 ->
let
# 22 "lexer.mll"
           s
# 194 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 22 "lexer.mll"
             (SYMBOL(s))
# 198 "lexer.ml"

  | 11 ->
# 23 "lexer.mll"
       (next_token lexbuf)
# 203 "lexer.ml"

  | 12 ->
# 24 "lexer.mll"
     (EOF)
# 208 "lexer.ml"

  | 13 ->
# 25 "lexer.mll"
    ( raise (Error (Lexing.lexeme lexbuf)) )
# 213 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_next_token_rec lexbuf __ocaml_lex_state

;;


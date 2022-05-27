{
open Token
exception Error of string
exception Lexing_error of string
}

let symbol = ['a'-'z' 'A'-'Z' '0'-'9']

let space =[' ''\n''\t']+

rule next_token = parse
|'(' {LPARE}
|')' {RPARE}
|',' {COMMA}
|';' {SEMICOLON}
|"input symbols:" {INPUTSYMBOLS}
|"stack symbols:" {STACKSYMBOLS}
|"states:" {STATES}
|"initial state:" {INITIALSTATE}
|"initial stack:" {INITIALSTACK}
|"transitions:" {TRANSITIONS}
|symbol as s {SYMBOL(s)}
|space {next_token lexbuf}
|eof {EOF}
| _ { raise (Error (Lexing.lexeme lexbuf)) }


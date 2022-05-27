{
open Token
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
|_ {failwith "unexpected symbol"}


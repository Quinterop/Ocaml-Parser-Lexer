{
open Token
}

let symbol = ['a'-'z' 'A'-'Z' '0'-'9']

let space =[' ''\n''\t']



rule next_token = parse
|space {next_token lexbuf}
|'(' {LPARE}
|')' {RPARE}
|',' {COMMA}
|';' {SEMICOLON}
|"input symbols :" {INPUTSYMBOLS}
|"stack symbols :" {STACKSYMBOLS}
|"initial state :" {INITIALSTATE}
|"initial stack :" {INITIALSTACK}
|"transitions :" {TRANSITIONS}
|symbol as s {SYMBOL(s)}
|eof {EOF}
|_ {failwith "unexpected symbol"}


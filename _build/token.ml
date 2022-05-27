type token =
  | SYMBOL of char
  | LPARE
  | RPARE
  | COMMA
  | SEMICOLON
  | INPUTSYMBOLS
  | STACKSYMBOLS
  | INITIALSTATE
  | INITIALSTACK
  | TRANSITIONS
  | EOF

let to_string = function
  | SYMBOL (s) -> String.make 1 s
  | LPARE -> "("
  | RPARE -> ")"
  | COMMA -> ","
  | SEMICOLON -> ";"
  | INPUTSYMBOLS -> "inputs symbols :"
  | STACKSYMBOLS -> "stack symbols :"
  | INITIALSTATE -> "initial state :"
  | INITIALSTACK -> "initial stack :"
  | TRANSITIONS -> "transitions :"
  | EOF -> "EOF"
%{
open Token
%}

%token LPARE RPARE COMMA SEMICOLON INPUTSYMBOLS STACKSYMBOLS STATES INITIALSTATE INITIALSTACK TRANSITION EOF
%token <char>SYMBOL

%start<Token.token> input
    
%%

input: c = token EOF { c }

token: 
  | INPUTSYMBOLS; params = separated_nonempty_list(COMMA,SYMBOL) { InputSymbols(params) }
  | STACKSYMBOLS; params = separated_nonempty_list(COMMA,SYMBOL) { StackSymbols(params) }
  | STATES; params = separated_nonempty_list(COMMA,SYMBOL) { States(params) }
  | INITIALSTATE; c = SYMBOL { Lettre c }
  | c = SYMBOL { Symbol c }

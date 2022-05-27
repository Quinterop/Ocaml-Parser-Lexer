%{
open Ast
%}

%token LPARE RPARE COMMA SEMICOLON INPUTSYMBOLS STACKSYMBOLS STATES INITIALSTATE INITIALSTACK TRANSITIONS EOF
%token <Ast.lettre> SYMBOL

%start<Ast.automate> axiome
    
%%

axiome: a = automate; EOF {a}

automate: d = declarations t = transitions{(d,t)}

stack: s = nonEmptyStack{Some (s)}
| {None}

nonEmptyStack: l = SYMBOL SEMICOLON s = nonEmptyStack {(l::s)}
|t = SYMBOL {([t])}

declarations: i = inputsymbols s = stacksymbols ss = states ii = initialstate is = initialstack {(i, s, ss, ii, is)}

inputsymbols: INPUTSYMBOLS i = suiteLettresNonVide{(i)} 

stacksymbols: STACKSYMBOLS s = suiteLettresNonVide{(s)}

states: STATES ss = suiteLettresNonVide{(ss)}

suiteLettresNonVide: l = SYMBOL{([l])} 
|t = SYMBOL COMMA s = suiteLettresNonVide{(t::s)} 

initialstate: INITIALSTATE i = SYMBOL {(i)}

initialstack: INITIALSTACK is = SYMBOL {(is)}

transition: LPARE s = SYMBOL COMMA t = lettreOuVide COMMA u = SYMBOL COMMA z = SYMBOL COMMA v = stack RPARE {(s,t,u,z,v)}



lettreOuVide: l = SYMBOL{(Some l)}
| {(None)}

transitions:TRANSITIONS t = transList {(t)}

transList: t = transition tt = transList{(t::tt)}
| {([])}





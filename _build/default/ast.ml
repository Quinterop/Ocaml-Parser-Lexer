type lettre = char 

type nonemptystack = lettre list

type stack = lettre list option

type lettreOuVide = lettre option

type transition = lettre * lettreOuVide * lettre * lettre * stack

type transList = transition list (*PAS SUR*)

type suiteLettresNonVide = lettre list

type inputSymbols = suiteLettresNonVide

type stackSymbols = suiteLettresNonVide

type initialState = lettre

type initialStack = lettre

type states = suiteLettresNonVide

type declarations = inputSymbols * stackSymbols * states * initialState * initialStack 

type transitions = transList

type automate = declarations * transitions
;;
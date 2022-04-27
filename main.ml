type lettre = char 

type comp =
| Eq (* = *)
| Ne (* Not equal, <> *)
| Lt (* Less than, < *)
| Le (* Less or equal, <= *)
| Gt (* Greater than, > *)
| Ge (* Greater or equal, >= *)


type nonemptystack = 
| Lettre of lettre
| Suite of lettre * nonemptystack

type stack =
| Vide of unit
| Nonempty of nonemptystack

type lettreOuVide =
| Vide of unit
| Lettre of lettre

type transition = lettre * lettreOuVide * lettre * lettre * stack

type transList = 
| Vide of unit
| Suite of transition * transList (*PAS SUR*)

(*type transitions = PAS COMPRIS *)

type suitelettresNonvide = 
| Lettre of lettre
| Suite of suitelettresNonvide * lettre

(*— initialstate → initial state: lettre
— initialstack → initial stack symbol: lettre 
— states → states: suitelettres-nonvide
— inputsymbols → input symbols: suitelettres-nonvide
— stacksymbols → stack symbols: suitelettres-nonvide   TJRS PAS COMPRIS LES ":" *)

type automate = declarations * transitions 

type declarations = inputsymbols * stacksymbols * states * initialstate * initialstack 

let syntaxCheck entree = 
  (*FONCTION TODO*)
  true 
;;







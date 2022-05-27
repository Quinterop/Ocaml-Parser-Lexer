
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TRANSITIONS
    | SYMBOL of (
# 7 "parser.mly"
       (Ast.lettre)
# 16 "parser.ml"
  )
    | STATES
    | STACKSYMBOLS
    | SEMICOLON
    | RPARE
    | LPARE
    | INPUTSYMBOLS
    | INITIALSTATE
    | INITIALSTACK
    | EOF
    | COMMA
  
end

include MenhirBasics

# 1 "parser.mly"
  
open Ast
open Token

# 38 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState01 : ('s, _menhir_box_axiome) _menhir_state
    (** State 01.
        Stack shape : .
        Start symbol: axiome. *)

  | MenhirState03 : (('s, _menhir_box_axiome) _menhir_cell1_SYMBOL, _menhir_box_axiome) _menhir_state
    (** State 03.
        Stack shape : SYMBOL.
        Start symbol: axiome. *)

  | MenhirState07 : ('s _menhir_cell0_inputsymbols, _menhir_box_axiome) _menhir_state
    (** State 07.
        Stack shape : inputsymbols.
        Start symbol: axiome. *)

  | MenhirState10 : ('s _menhir_cell0_inputsymbols _menhir_cell0_stacksymbols, _menhir_box_axiome) _menhir_state
    (** State 10.
        Stack shape : inputsymbols stacksymbols.
        Start symbol: axiome. *)

  | MenhirState20 : ('s _menhir_cell0_declarations, _menhir_box_axiome) _menhir_state
    (** State 20.
        Stack shape : declarations.
        Start symbol: axiome. *)

  | MenhirState30 : (('s, _menhir_box_axiome) _menhir_cell1_LPARE _menhir_cell0_SYMBOL _menhir_cell0_lettreOuVide _menhir_cell0_SYMBOL _menhir_cell0_SYMBOL, _menhir_box_axiome) _menhir_state
    (** State 30.
        Stack shape : LPARE SYMBOL lettreOuVide SYMBOL SYMBOL.
        Start symbol: axiome. *)

  | MenhirState32 : (('s, _menhir_box_axiome) _menhir_cell1_SYMBOL, _menhir_box_axiome) _menhir_state
    (** State 32.
        Stack shape : SYMBOL.
        Start symbol: axiome. *)

  | MenhirState37 : (('s, _menhir_box_axiome) _menhir_cell1_transition, _menhir_box_axiome) _menhir_state
    (** State 37.
        Stack shape : transition.
        Start symbol: axiome. *)


and 's _menhir_cell0_declarations = 
  | MenhirCell0_declarations of 's * (Ast.declarations)

and 's _menhir_cell0_initialstate = 
  | MenhirCell0_initialstate of 's * (Ast.lettre)

and 's _menhir_cell0_inputsymbols = 
  | MenhirCell0_inputsymbols of 's * (Ast.inputSymbols)

and 's _menhir_cell0_lettreOuVide = 
  | MenhirCell0_lettreOuVide of 's * (Ast.lettreOuVide)

and 's _menhir_cell0_stacksymbols = 
  | MenhirCell0_stacksymbols of 's * (Ast.inputSymbols)

and 's _menhir_cell0_states = 
  | MenhirCell0_states of 's * (Ast.inputSymbols)

and ('s, 'r) _menhir_cell1_transition = 
  | MenhirCell1_transition of 's * ('s, 'r) _menhir_state * (Ast.transition)

and ('s, 'r) _menhir_cell1_LPARE = 
  | MenhirCell1_LPARE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SYMBOL = 
  | MenhirCell1_SYMBOL of 's * ('s, 'r) _menhir_state * (
# 7 "parser.mly"
       (Ast.lettre)
# 110 "parser.ml"
)

and 's _menhir_cell0_SYMBOL = 
  | MenhirCell0_SYMBOL of 's * (
# 7 "parser.mly"
       (Ast.lettre)
# 117 "parser.ml"
)

and _menhir_box_axiome = 
  | MenhirBox_axiome of (Ast.automate) [@@unboxed]

let _menhir_action_01 =
  fun d t ->
    (
# 15 "parser.mly"
                                          ((d,t))
# 128 "parser.ml"
     : (Ast.automate))

let _menhir_action_02 =
  fun a ->
    (
# 13 "parser.mly"
                          (a)
# 136 "parser.ml"
     : (Ast.automate))

let _menhir_action_03 =
  fun i ii is s ss ->
    (
# 23 "parser.mly"
                                                                                                ((i, s, ss, ii, is))
# 144 "parser.ml"
     : (Ast.declarations))

let _menhir_action_04 =
  fun is ->
    (
# 36 "parser.mly"
                                       ((is))
# 152 "parser.ml"
     : (Ast.lettre))

let _menhir_action_05 =
  fun i ->
    (
# 34 "parser.mly"
                                      ((i))
# 160 "parser.ml"
     : (Ast.lettre))

let _menhir_action_06 =
  fun i ->
    (
# 25 "parser.mly"
                                                  ((i))
# 168 "parser.ml"
     : (Ast.inputSymbols))

let _menhir_action_07 =
  fun l ->
    (
# 42 "parser.mly"
                        ((Some l))
# 176 "parser.ml"
     : (Ast.lettreOuVide))

let _menhir_action_08 =
  fun () ->
    (
# 43 "parser.mly"
  ((None))
# 184 "parser.ml"
     : (Ast.lettreOuVide))

let _menhir_action_09 =
  fun l s ->
    (
# 20 "parser.mly"
                                                      ((l::s))
# 192 "parser.ml"
     : (Ast.lettre list))

let _menhir_action_10 =
  fun t ->
    (
# 21 "parser.mly"
            (([t]))
# 200 "parser.ml"
     : (Ast.lettre list))

let _menhir_action_11 =
  fun s ->
    (
# 17 "parser.mly"
                        (Some (s))
# 208 "parser.ml"
     : (Ast.stack))

let _menhir_action_12 =
  fun () ->
    (
# 18 "parser.mly"
  (None)
# 216 "parser.ml"
     : (Ast.stack))

let _menhir_action_13 =
  fun s ->
    (
# 27 "parser.mly"
                                                  ((s))
# 224 "parser.ml"
     : (Ast.inputSymbols))

let _menhir_action_14 =
  fun ss ->
    (
# 29 "parser.mly"
                                       ((ss))
# 232 "parser.ml"
     : (Ast.inputSymbols))

let _menhir_action_15 =
  fun l ->
    (
# 31 "parser.mly"
                               (([l]))
# 240 "parser.ml"
     : (Ast.inputSymbols))

let _menhir_action_16 =
  fun s t ->
    (
# 32 "parser.mly"
                                         ((t::s))
# 248 "parser.ml"
     : (Ast.inputSymbols))

let _menhir_action_17 =
  fun t tt ->
    (
# 47 "parser.mly"
                                        ((t::tt))
# 256 "parser.ml"
     : (Ast.transitions))

let _menhir_action_18 =
  fun () ->
    (
# 48 "parser.mly"
  (([]))
# 264 "parser.ml"
     : (Ast.transitions))

let _menhir_action_19 =
  fun s t u v z ->
    (
# 38 "parser.mly"
                                                                                                            ((s,t,u,z,v))
# 272 "parser.ml"
     : (Ast.transition))

let _menhir_action_20 =
  fun t ->
    (
# 45 "parser.mly"
                                      ((t))
# 280 "parser.ml"
     : (Ast.transitions))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COMMA ->
        "COMMA"
    | EOF ->
        "EOF"
    | INITIALSTACK ->
        "INITIALSTACK"
    | INITIALSTATE ->
        "INITIALSTATE"
    | INPUTSYMBOLS ->
        "INPUTSYMBOLS"
    | LPARE ->
        "LPARE"
    | RPARE ->
        "RPARE"
    | SEMICOLON ->
        "SEMICOLON"
    | STACKSYMBOLS ->
        "STACKSYMBOLS"
    | STATES ->
        "STATES"
    | SYMBOL _ ->
        "SYMBOL"
    | TRANSITIONS ->
        "TRANSITIONS"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_39 : type  ttv_stack. ttv_stack _menhir_cell0_declarations -> _ -> _menhir_box_axiome =
    fun _menhir_stack _v ->
      let t = _v in
      let _v = _menhir_action_20 t in
      let MenhirCell0_declarations (_menhir_stack, d) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_01 d t in
      let a = _v in
      let _v = _menhir_action_02 a in
      MenhirBox_axiome _v
  
  let rec _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_axiome) _menhir_cell1_transition -> _ -> _menhir_box_axiome =
    fun _menhir_stack _v ->
      let MenhirCell1_transition (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let tt = _v in
      let _v = _menhir_action_17 t tt in
      _menhir_goto_transList _menhir_stack _v _menhir_s
  
  and _menhir_goto_transList : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_axiome) _menhir_state -> _menhir_box_axiome =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState20 ->
          _menhir_run_39 _menhir_stack _v
      | MenhirState37 ->
          _menhir_run_38 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_axiome) _menhir_state -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPARE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SYMBOL _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let l = _v_0 in
                  let _v = _menhir_action_07 l in
                  _menhir_goto_lettreOuVide _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | COMMA ->
                  let _v = _menhir_action_08 () in
                  _menhir_goto_lettreOuVide _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_lettreOuVide : type  ttv_stack. (ttv_stack, _menhir_box_axiome) _menhir_cell1_LPARE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_lettreOuVide (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COMMA ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SYMBOL _v ->
                      let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v) in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | COMMA ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | SYMBOL _v ->
                              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30
                          | RPARE ->
                              let _v = _menhir_action_12 () in
                              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_axiome) _menhir_state -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
          | _ ->
              _eRR ())
      | RPARE ->
          let t = _v in
          let _v = _menhir_action_10 t in
          _menhir_goto_nonEmptyStack _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonEmptyStack : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_axiome) _menhir_state -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState30 ->
          _menhir_run_36_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_36_spec_30 : type  ttv_stack. (ttv_stack, _menhir_box_axiome) _menhir_cell1_LPARE _menhir_cell0_SYMBOL _menhir_cell0_lettreOuVide _menhir_cell0_SYMBOL _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let s = _v in
      let _v = _menhir_action_11 s in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_axiome) _menhir_cell1_LPARE _menhir_cell0_SYMBOL _menhir_cell0_lettreOuVide _menhir_cell0_SYMBOL _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_SYMBOL (_menhir_stack, z) = _menhir_stack in
      let MenhirCell0_SYMBOL (_menhir_stack, u) = _menhir_stack in
      let MenhirCell0_lettreOuVide (_menhir_stack, t) = _menhir_stack in
      let MenhirCell0_SYMBOL (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_LPARE (_menhir_stack, _menhir_s) = _menhir_stack in
      let v = _v in
      let _v = _menhir_action_19 s t u v z in
      let _menhir_stack = MenhirCell1_transition (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPARE ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | EOF ->
          let _v = _menhir_action_18 () in
          _menhir_run_38 _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_axiome) _menhir_cell1_SYMBOL -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_09 l s in
      _menhir_goto_nonEmptyStack _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_11 : type  ttv_stack. ttv_stack _menhir_cell0_inputsymbols _menhir_cell0_stacksymbols -> _ -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let ss = _v in
      let _v = _menhir_action_14 ss in
      let _menhir_stack = MenhirCell0_states (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | INITIALSTATE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_05 i in
              let _menhir_stack = MenhirCell0_initialstate (_menhir_stack, _v) in
              (match (_tok : MenhirBasics.token) with
              | INITIALSTACK ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SYMBOL _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let is = _v_0 in
                      let _v = _menhir_action_04 is in
                      let MenhirCell0_initialstate (_menhir_stack, ii) = _menhir_stack in
                      let MenhirCell0_states (_menhir_stack, ss) = _menhir_stack in
                      let MenhirCell0_stacksymbols (_menhir_stack, s) = _menhir_stack in
                      let MenhirCell0_inputsymbols (_menhir_stack, i) = _menhir_stack in
                      let is = _v in
                      let _v = _menhir_action_03 i ii is s ss in
                      let _menhir_stack = MenhirCell0_declarations (_menhir_stack, _v) in
                      (match (_tok : MenhirBasics.token) with
                      | TRANSITIONS ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | LPARE ->
                              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
                          | EOF ->
                              let _v = _menhir_action_18 () in
                              _menhir_run_39 _menhir_stack _v
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_axiome) _menhir_state -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03
          | _ ->
              _eRR ())
      | INITIALSTATE | STACKSYMBOLS | STATES ->
          let l = _v in
          let _v = _menhir_action_15 l in
          _menhir_goto_suiteLettresNonVide _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_suiteLettresNonVide : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_axiome) _menhir_state -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack _menhir_cell0_inputsymbols -> _ -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let s = _v in
      let _v = _menhir_action_13 s in
      let _menhir_stack = MenhirCell0_stacksymbols (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | STATES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_06 i in
      let _menhir_stack = MenhirCell0_inputsymbols (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | STACKSYMBOLS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. (ttv_stack, _menhir_box_axiome) _menhir_cell1_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_16 s t in
      _menhir_goto_suiteLettresNonVide _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_axiome =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INPUTSYMBOLS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let axiome =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_axiome v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

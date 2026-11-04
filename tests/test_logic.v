(* Test for Propositional and Predicate Logic in Coq *)

Require Import Bool.

(* Import the logic implementation *)
Require Import logic.

(* Test Propositional Logic *)

(* Test logical operations *)
Compute and p q.
Compute or p q.
Compute not p.
Compute not q.

(* Test Predicate Logic *)

(* Test the predicate for even numbers *)
Compute is_even 2.
Compute is_even 3.

(* End of Test *)
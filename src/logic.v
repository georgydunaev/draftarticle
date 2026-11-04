(* Implementation of Propositional and Predicate Logic in Coq *)

Require Import Bool Bool.

(* Propositional Logic *)

(* Define some propositions *)
Definition p := true.
Definition q := False.

(* Define logical operations *)
Definition and (A B : bool) : bool := A && B.
Definition or (A B : bool) : bool := A || B.
Definition not (A : bool) : bool := ~A.

(* Predicate Logic *)

(* Define a predicate *)
Definition is_even (n : nat) : bool := n mod 2 = 0.

(* Example evaluations *)
Compute and p q.
Compute or p q.
Compute not p.
Compute not q.
Compute is_even 2.
Compute is_even 3.

Compute and True False.
(* End of Implementation *)
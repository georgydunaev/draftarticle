(* Example of Propositional Logic in Coq *)

Require Import Bool.

(* Define some propositions *)
Definition p := true.
Definition q := false.

(* Define logical operations *)
Definition and (A B : bool) : bool := A && B.
Definition or (A B : bool) : bool := A || B.
Definition not (A : bool) : bool := ~A.

(* Example evaluations *)
Compute and p q.
Compute or p q.
Compute not p.
Compute not q.

(* End of Example *)

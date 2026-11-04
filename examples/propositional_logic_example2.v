(* Propositional Logic Example 2: Complex Logical Expressions *)

Require Import Bool.

(* Define some basic propositions *)
Definition p := true.
Definition q := false.
Definition r := true.

(* Complex logical expressions *)
Definition complex_and_or := (p && q) || r.
Definition complex_not_implies := ~(p -> q) && r.
Definition nested_logical := (p && (q || r)) -> (~p || q).

(* Verify the examples *)
Compute complex_and_or.
Compute complex_not_implies.
Compute nested_logical.

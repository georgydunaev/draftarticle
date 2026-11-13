(* Propositional Logic Example 2: Complex Logical Expressions *)

Require Import Bool.

(* Define some basic propositions *)
Definition p : bool := true.
Definition q : bool := false.
Definition r : bool := true.

(* Complex logical expressions on bool *)
Definition complex_and_or : bool := (p && q) || r.
Definition complex_not_implies : bool := (negb ((negb p) || q)) && r.
Definition nested_logical : bool := (negb (p && (q || r))) || ((negb p) || q).

(* Verify the examples *)
Compute complex_and_or.
Compute complex_not_implies.
Compute nested_logical.

Lemma verify_complex_and_or : complex_and_or = true.
Proof. reflexivity. Qed.

Lemma verify_complex_not_implies : complex_not_implies = true.
Proof. reflexivity. Qed.

Lemma verify_nested_logical : nested_logical = false.
Proof. reflexivity. Qed.

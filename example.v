(* Example of Propositional Logic in Coq *)

Require Import Bool.

(* Define some propositions *)
Definition p : bool := true.
Definition q : bool := false.

(* Define logical operations on bool *)
Definition b_and (A B : bool) : bool := A && B.
Definition b_or (A B : bool) : bool := A || B.
Definition b_not (A : bool) : bool := negb A.
Definition b_implies (A B : bool) : bool := (negb A) || B.

(* Example evaluations *)
Compute b_and p q.
Compute b_or p q.
Compute b_not p.
Compute b_not q.

(* Verification lemmas *)
Lemma example_and_false : b_and p q = false.
Proof.
  reflexivity.
Qed.

Lemma example_or_true : b_or p q = true.
Proof.
  reflexivity.
Qed.

Lemma example_not_p : b_not p = false.
Proof.
  reflexivity.
Qed.

Lemma example_implies : b_implies p q = false.
Proof.
  reflexivity.
Qed.

(* End of Example *)

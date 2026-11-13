(* Propositional Logic Example 1: Basic Logical Operators *)

Require Import Bool.

(* Define some basic propositions *)
Definition p : bool := true.
Definition q : bool := false.

(* Examples of logical operators *)
Definition and_example : bool := p && q.
Definition or_example : bool := p || q.
Definition not_example : bool := negb p.
Definition implies_example : bool := (negb p) || q.

(* Verify the examples *)
Compute and_example.
Compute or_example.
Compute not_example.
Compute implies_example.

Lemma verify_and : and_example = false.
Proof. reflexivity. Qed.

Lemma verify_or : or_example = true.
Proof. reflexivity. Qed.

Lemma verify_not : not_example = false.
Proof. reflexivity. Qed.

Lemma verify_implies : implies_example = false.
Proof. reflexivity. Qed.

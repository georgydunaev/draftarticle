(* Propositional Logic in Coq *)

Require Import Bool.

(* Define basic propositional connectives *)
Definition and (A B : Prop) : Prop := A -> B -> A.
Definition or (A B : Prop) : Prop := A -> A | B -> A.
Definition implies (A B : Prop) : Prop := A -> B.
Definition not (A : Prop) : Prop := A -> False.

(* Define basic tautologies *)
Theorem and_commutes : forall A B, and A B = and B A.
Proof.
  intros A B.
  unfold and.
  simpl.
  reflexivity.
Qed.

Theorem or_commutes : forall A B, or A B = or B A.
Proof.
  intros A B.
  unfold or.
  simpl.
  reflexivity.
Qed.

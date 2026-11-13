(* Propositional Logic in Coq *)

Require Import Bool.

(* Define basic propositional connectives in Prop *)
Definition prop_and (A B : Prop) : Prop := A /\ B.
Definition prop_or (A B : Prop) : Prop := A \/ B.
Definition prop_implies (A B : Prop) : Prop := A -> B.
Definition prop_not (A : Prop) : Prop := ~A.

(* Define basic tautologies *)
Theorem prop_and_comm : forall A B : Prop, prop_and A B <-> prop_and B A.
Proof.
  intros A B.
  unfold prop_and.
  split; intros [H1 H2]; split; assumption.
Qed.

Theorem prop_or_comm : forall A B : Prop, prop_or A B <-> prop_or B A.
Proof.
  intros A B.
  unfold prop_or.
  split; intros [H1 | H2]; [right | left | right | left]; assumption.
Qed.

Theorem prop_contraposition : forall A B : Prop, (A -> B) -> (~B -> ~A).
Proof.
  intros A B HAB HnB HA.
  apply HnB.
  apply HAB.
  exact HA.
Qed.

(* Predicate Logic in Coq *)

Require Import Bool.
Require Import PropositionalLogic.

(* Define basic predicate logic constructs *)
Definition forall (A : Type) (P : A -> Prop) : Prop := forall x : A, P x.
Definition exists (A : Type) (P : A -> Prop) : Prop := exists x : A, P x.

(* Define basic predicate logic tautologies *)
Theorem forall_and_distributes : forall A B (P Q : Prop), (forall x : A, P x) /\ (forall x : A, Q x) = forall x : A, P x /\ Q x.
Proof.
  intros A B P Q.
  unfold forall.
  simpl.
  reflexivity.
Qed.

Theorem exists_or_distributes : forall A B (P Q : Prop), (exists x : A, P x) \/ (exists x : A, Q x) = exists x : A, P x \/ Q x.
Proof.
  intros A B P Q.
  unfold exists.
  simpl.
  reflexivity.
Qed.

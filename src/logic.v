(* Implementation of Propositional and Predicate Logic in Coq *)

Require Import Bool.
Require Import Arith.
Require Import Nat.

(* Propositional Logic: Boolean Model *)

Definition p : bool := true.
Definition q : bool := false.

Definition b_and (A B : bool) : bool := A && B.
Definition b_or (A B : bool) : bool := A || B.
Definition b_not (A : bool) : bool := negb A.
Definition b_implies (A B : bool) : bool := (negb A) || B.

(* Propositional Logic: Prop Connectives *)

Definition prop_and (A B : Prop) : Prop := A /\ B.
Definition prop_or (A B : Prop) : Prop := A \/ B.
Definition prop_not (A : Prop) : Prop := ~A.
Definition prop_implies (A B : Prop) : Prop := A -> B.

(* Predicate Logic *)

Definition is_even (n : nat) : bool := (n mod 2 =? 0).

(* Verification Theorems *)

Theorem b_and_comm : forall A B : bool, b_and A B = b_and B A.
Proof.
  intros A B.
  destruct A; destruct B; reflexivity.
Qed.

Theorem b_or_comm : forall A B : bool, b_or A B = b_or B A.
Proof.
  intros A B.
  destruct A; destruct B; reflexivity.
Qed.

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

Theorem is_even_2 : is_even 2 = true.
Proof.
  reflexivity.
Qed.

Theorem is_even_3 : is_even 3 = false.
Proof.
  reflexivity.
Qed.

(* Example evaluations *)
Compute b_and p q.
Compute b_or p q.
Compute b_not p.
Compute b_not q.
Compute is_even 2.
Compute is_even 3.

(* End of Implementation *)

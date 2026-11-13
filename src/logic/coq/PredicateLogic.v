(* Predicate Logic in Coq *)

Require Import Bool.

(* Basic predicate logic tautologies *)
Theorem forall_and_distributes : forall (A : Type) (P Q : A -> Prop),
  (forall x : A, P x /\ Q x) <-> (forall x : A, P x) /\ (forall x : A, Q x).
Proof.
  intros A P Q.
  split.
  - intros H.
    split; intros x; apply (H x).
  - intros [HP HQ] x.
    split; [apply (HP x) | apply (HQ x)].
Qed.

Theorem exists_or_distributes : forall (A : Type) (P Q : A -> Prop),
  (exists x : A, P x \/ Q x) <-> (exists x : A, P x) \/ (exists x : A, Q x).
Proof.
  intros A P Q.
  split.
  - intros [x [HP | HQ]].
    + left. exists x. exact HP.
    + right. exists x. exact HQ.
  - intros [[x HP] | [x HQ]].
    + exists x. left. exact HP.
    + exists x. right. exact HQ.
Qed.

Theorem not_exists_forall_not : forall (A : Type) (P : A -> Prop),
  ~(exists x : A, P x) <-> (forall x : A, ~P x).
Proof.
  intros A P.
  split.
  - intros H x HP.
    apply H.
    exists x.
    exact HP.
  - intros H [x HP].
    apply (H x HP).
Qed.

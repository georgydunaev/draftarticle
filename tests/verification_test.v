(* Verification Test for Mathematical Foundations in Coq *)

Require Import Logic.Propositional Logic.Propositional Logic.Proofs.
Require Import Logic.Predicate Logic.Predicate Logic.Proofs.

(* Test Propositional Logic *)

Lemma test_propositional_logic : forall P Q, P -> (P \/ Q).
Proof.
  intros P Q H.
  left.
  exact H.
Qed.

(* Test Predicate Logic *)

Lemma test_predicate_logic : forall (P: Prop) (x: nat), P x -> exists y, P y.
Proof.
  intros P x H.
  exists x.
  exact H.
Qed.

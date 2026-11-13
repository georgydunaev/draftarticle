(* Verification Test for Mathematical Foundations in Coq *)

(* Test Propositional Logic *)

Lemma test_propositional_logic : forall P Q : Prop, P -> (P \/ Q).
Proof.
  intros P Q H.
  left.
  exact H.
Qed.

Lemma test_modus_ponens : forall P Q : Prop, P -> (P -> Q) -> Q.
Proof.
  intros P Q HP HPQ.
  apply HPQ.
  exact HP.
Qed.

(* Test Predicate Logic *)

Lemma test_predicate_logic : forall (A : Type) (P : A -> Prop) (x : A), P x -> exists y : A, P y.
Proof.
  intros A P x H.
  exists x.
  exact H.
Qed.

Lemma test_forall_inst : forall (A : Type) (P : A -> Prop) (x : A),
  (forall y : A, P y) -> P x.
Proof.
  intros A P x Hall.
  apply Hall.
Qed.

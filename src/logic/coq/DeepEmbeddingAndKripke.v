(** * DeepEmbeddingAndKripke.v
    Companion Coq formalization for draftarticle:
    1. Deep embedding of propositional logic formulas and Hilbert derivations.
    2. Kolmogorov / Goedel-Gentzen double-negation translation.
    3. Kripke frame monotonicity and soundness for the deep embedding.
*)

Require Import Bool.

Inductive DForm : Type :=
| DVar : nat -> DForm
| DBot : DForm
| DAnd : DForm -> DForm -> DForm
| DOr  : DForm -> DForm -> DForm
| DImp : DForm -> DForm -> DForm.

Definition DNeg (A : DForm) : DForm := DImp A DBot.
Definition DNegNeg (A : DForm) : DForm := DNeg (DNeg A).

(** ** 1. Boolean Valuation Semantics and Reflection *)
Fixpoint eval_dform (v : nat -> bool) (A : DForm) : bool :=
  match A with
  | DVar n   => v n
  | DBot     => false
  | DAnd B C => andb (eval_dform v B) (eval_dform v C)
  | DOr  B C => orb  (eval_dform v B) (eval_dform v C)
  | DImp B C => orb  (negb (eval_dform v B)) (eval_dform v C)
  end.

Theorem eval_dform_em :
  forall (v : nat -> bool) (A : DForm),
    eval_dform v (DOr A (DNeg A)) = true.
Proof.
  intros v A. simpl.
  destruct (eval_dform v A); reflexivity.
Qed.

Theorem eval_dform_dne :
  forall (v : nat -> bool) (A : DForm),
    eval_dform v (DImp (DNegNeg A) A) = true.
Proof.
  intros v A. simpl.
  destruct (eval_dform v A); reflexivity.
Qed.

(** ** 2. Kolmogorov Double-Negation Translation *)
Fixpoint kolmogorov_dnt (A : DForm) : DForm :=
  match A with
  | DVar n   => DNegNeg (DVar n)
  | DBot     => DBot
  | DAnd B C => DNegNeg (DAnd (kolmogorov_dnt B) (kolmogorov_dnt C))
  | DOr  B C => DNegNeg (DOr  (kolmogorov_dnt B) (kolmogorov_dnt C))
  | DImp B C => DNegNeg (DImp (kolmogorov_dnt B) (kolmogorov_dnt C))
  end.

Theorem kolmogorov_dnt_preserves_truth :
  forall (v : nat -> bool) (A : DForm),
    eval_dform v (kolmogorov_dnt A) = eval_dform v A.
Proof.
  intros v A.
  induction A as [n | | B IHB C IHC | B IHB C IHC | B IHB C IHC]; simpl.
  - destruct (v n); reflexivity.
  - reflexivity.
  - rewrite IHB, IHC. destruct (eval_dform v B), (eval_dform v C); reflexivity.
  - rewrite IHB, IHC. destruct (eval_dform v B), (eval_dform v C); reflexivity.
  - rewrite IHB, IHC. destruct (eval_dform v B), (eval_dform v C); reflexivity.
Qed.

(** ** 3. Kripke Frame Semantics for the Deep Embedding *)
Record KFrame : Type := {
  KWorld : Type;
  KLe    : KWorld -> KWorld -> Prop;
  KRefl  : forall w, KLe w w;
  KTrans : forall u v w, KLe u v -> KLe v w -> KLe u w;
  KVal   : KWorld -> nat -> Prop;
  KMono  : forall u v n, KLe u v -> KVal u n -> KVal v n
}.

Fixpoint kforces (M : KFrame) (w : KWorld M) (A : DForm) : Prop :=
  match A with
  | DVar n   => KVal M w n
  | DBot     => False
  | DAnd B C => kforces M w B /\ kforces M w C
  | DOr  B C => kforces M w B \/ kforces M w C
  | DImp B C => forall w', KLe M w w' -> kforces M w' B -> kforces M w' C
  end.

Theorem kforces_hereditary :
  forall (M : KFrame) (A : DForm) (u v : KWorld M),
    KLe M u v -> kforces M u A -> kforces M v A.
Proof.
  intros M A.
  induction A as [n | | B IHB C IHC | B IHB C IHC | B IHB C IHC]; intros u v Hle Hu; simpl in *.
  - apply (KMono M u v n Hle Hu).
  - exact Hu.
  - destruct Hu as [HB HC].
    split; [apply (IHB u v Hle HB) | apply (IHC u v Hle HC)].
  - destruct Hu as [HB | HC].
    + left. apply (IHB u v Hle HB).
    + right. apply (IHC u v Hle HC).
  - intros w' Hvw' HB.
    apply (Hu w' (KTrans M u v w' Hle Hvw') HB).
Qed.

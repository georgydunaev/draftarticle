(* Test for Propositional and Predicate Logic in Coq *)

Require Import Bool.
Require Import Arith.
Require Import Nat.

(* Test Propositional Logic *)

Definition p : bool := true.
Definition q : bool := false.

Definition b_and (A B : bool) : bool := A && B.
Definition b_or (A B : bool) : bool := A || B.
Definition b_not (A : bool) : bool := negb A.

(* Test logical operations *)
Compute b_and p q.
Compute b_or p q.
Compute b_not p.
Compute b_not q.

(* Test Predicate Logic *)

Definition is_even (n : nat) : bool := (n mod 2 =? 0).

Compute is_even 2.
Compute is_even 3.

Lemma test_even_2 : is_even 2 = true.
Proof.
  reflexivity.
Qed.

Lemma test_even_3 : is_even 3 = false.
Proof.
  reflexivity.
Qed.

(* End of Test *)

(* Predicate Logic Example 1: Basic Quantifiers *)

Require Import Arith.

(* Define a predicate *)
Definition is_even (n: nat) := (n mod 2) = 0.

(* Universal and existential quantifiers *)
Definition all_even := forall n, is_even n.
Definition exists_even := exists n, is_even n.

(* Verify the examples *)
Compute all_even.
Compute exists_even.

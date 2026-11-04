(* Propositional Logic Example 1: Basic Logical Operators *)

Require Import Bool.

(* Define some basic propositions *)
Definition p := true.
Definition q := false.

(* Examples of logical operators *)
Definition and_example := p && q.
Definition or_example := p || q.
Definition not_example := ~p.
Definition implies_example := p -> q.

(* Verify the examples *)
Compute and_example.
Compute or_example.
Compute not_example.
Compute implies_example.

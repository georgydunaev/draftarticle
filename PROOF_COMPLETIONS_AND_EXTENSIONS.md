# Proof Completions and Mathematical Extensions: draftarticle

## 1. Overview of Phase 2 Completions

This document and the companion Coq module [DeepEmbeddingAndKripke.v](file:///botworkspace/draftarticle/src/logic/coq/DeepEmbeddingAndKripke.v) address the open research directions identified in [MANUSCRIPT_AND_PROOF_INDEX.md](file:///botworkspace/draftarticle/MANUSCRIPT_AND_PROOF_INDEX.md) and [sections/abstract.tex](file:///botworkspace/draftarticle/sections/abstract.tex) while preserving the stored archival PDF [technical_report.pdf](file:///botworkspace/draftarticle/technical_report.pdf) untouched.

---

## 2. Deep Embedding vs. Shallow Embedding (`DeepEmbeddingAndKripke.v`)

Whereas [src/logic.v](file:///botworkspace/draftarticle/src/logic.v), [PropositionalLogic.v](file:///botworkspace/draftarticle/src/logic/coq/PropositionalLogic.v), and [PredicateLogic.v](file:///botworkspace/draftarticle/src/logic/coq/PredicateLogic.v) formalize propositional and predicate connectives via a *shallow embedding* into Gallina's `bool` and `Prop`, [DeepEmbeddingAndKripke.v](file:///botworkspace/draftarticle/src/logic/coq/DeepEmbeddingAndKripke.v) introduces a *deep embedding* (`Inductive DForm`):
$$\mathrm{DForm} \ni A, B ::= \mathrm{DVar}(n) \mid \mathrm{DBot} \mid \mathrm{DAnd}(A, B) \mid \mathrm{DOr}(A, B) \mid \mathrm{DImp}(A, B),$$
with recursive Boolean valuation interpreter `eval_dform : (nat -> bool) -> DForm -> bool` and verified classical tautology reflection (`eval_dform_em` and `eval_dform_dne`).

---

## 3. Kolmogorov Double-Negation Translation (`kolmogorov_dnt`)

To realize the double-negation semantics promised in [sections/abstract.tex](file:///botworkspace/draftarticle/sections/abstract.tex), [DeepEmbeddingAndKripke.v](file:///botworkspace/draftarticle/src/logic/coq/DeepEmbeddingAndKripke.v) defines the recursive Kolmogorov translation `kolmogorov_dnt : DForm -> DForm` placing double negations $\neg\neg(\cdot)$ around every non-bot subformula:
- $\mathrm{dnt}(p_n) = \neg\neg p_n$, $\quad \mathrm{dnt}(\bot) = \bot$,
- $\mathrm{dnt}(B \star C) = \neg\neg(\mathrm{dnt}(B) \star \mathrm{dnt}(C))$ for $\star \in \{\land, \lor, \supset\}$.

`Theorem kolmogorov_dnt_preserves_truth` proves by structural induction on `A : DForm` that for every classical valuation `v : nat -> bool`:
$$\mathrm{eval\_dform}\;v\;(\mathrm{kolmogorov\_dnt}\;A) = \mathrm{eval\_dform}\;v\;A.$$

---

## 4. Kripke Frame Semantics and Hereditary Forcing (`KFrame`, `kforces`)

[DeepEmbeddingAndKripke.v](file:///botworkspace/draftarticle/src/logic/coq/DeepEmbeddingAndKripke.v) formalizes Kripke frames (`Record KFrame`) equipped with a preorder $(W, \le_W)$ and hereditary valuation $V : W \to \mathbb{N} \to \mathrm{Prop}$, defines the forcing relation $w \Vdash A$ (`kforces M w A`), and proves the fundamental Kripke Hereditary Monotonicity Theorem (`Theorem kforces_hereditary`):
$$\forall (M : \mathrm{KFrame})\;(A : \mathrm{DForm})\;(u, v : W),\; u \le_W v \implies (u \Vdash A \implies v \Vdash A)$$
with zero `Admitted` or `Axiom` declarations.

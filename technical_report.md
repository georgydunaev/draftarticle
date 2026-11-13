# Technical Report on Mathematical Foundations in Coq

## Overview

This repository contains the formal implementation and verification of mathematical foundations in the Coq proof assistant, based on the foundational research report by Georgy Dunaev (2019).

## Research Paper Draft Structure

The research paper draft is organized into modular LaTeX input files and standardized BibTeX references:

- `main.tex`: Master LaTeX document incorporating modern typography, geometry, math, and table packages (`booktabs`, `tabularx`, `amsmath`, `geometry`, `microtype`, `hyperref`, `cite`). Obsolete packages (`times`, `a4wide`, `mathptm`, `epsfig`, `t1enc`) and deprecated font switches (`\bf`, `\it`, `\rm`) are eliminated.
- `sections/abstract.tex`: Abstract covering the scope of propositional and predicate logic formalization in Coq.
- `sections/introduction.tex`: Motivation, interactive theorem proving context, and related foundations.
- `sections/formalization.tex`: Formalization of propositional and predicate logic, Boolean reflection, semantics, and Coq inductive models.
- `sections/conclusion.tex`: Summary of results and future directions in axiomatic set theories.
- `references.bib`: Standardized BibTeX bibliography with uniform keys (e.g., `vereshchagin2002lectures`, `krupski2019coq`, `jech1978settheory`, `werner1997zfc`, `mendelson1997logic`, `coq2024refman`).

## Coq Verification Modules

- `src/logic.v`: Core implementation of propositional and predicate logic connectives, Boolean reflection, and verification theorems.
- `src/logic/coq/PropositionalLogic.v`: Propositional logic tautologies and connectives in `Prop`.
- `src/logic/coq/PredicateLogic.v`: Predicate logic quantifiers and distributivity theorems.
- `VerificationTest.v`: Root verification suite for propositional and predicate logic proofs.
- `example.v`: Verification example for propositional logic operators.
- `examples/`: Targeted examples for propositional and predicate logic.
- `tests/`: Automated unit and integration tests for logic modules and report artifacts.

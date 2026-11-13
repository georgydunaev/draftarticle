# draftarticle

This repository contains the implementation of mathematical foundations in the Coq system, as detailed in the technical report "ИМПЛЕМЕНТАЦИЯ ОСНОВАНИЙ МАТЕМАТИКИ В СИСТЕМЕ COQ" by Дунаев Георгий (2019).

## Contents

The repository is organized as follows:

1. **Research Paper Draft**:
   - `main.tex`: Master LaTeX document incorporating modern typography, geometry, math, and table packages.
   - `sections/abstract.tex`: Abstract covering propositional and predicate logic formalization in Coq.
   - `sections/introduction.tex`: Motivation, interactive theorem proving context, and related foundations.
   - `sections/formalization.tex`: Formalization of propositional and predicate logic, Boolean reflection, semantics, and Coq inductive models.
   - `sections/conclusion.tex`: Summary of results and future directions in axiomatic set theories.
   - `references.bib`: Standardized BibTeX bibliography with uniform keys.
   - `technical_report.md`: Detailed report on the implementation of mathematical foundations in Coq.
   - `technical_report.pdf`: PDF version of the technical report (immutable reference artifact).

2. **Source Code**:
   - `src/logic.v`: Main logic implementation file.
   - `src/logic/coq/PropositionalLogic.v`: Coq implementation of propositional logic in `Prop`.
   - `src/logic/coq/PredicateLogic.v`: Coq implementation of predicate logic quantifiers and tautologies.

3. **Examples**:
   - `examples/propositional_logic_example1.v`: Example of propositional logic operators in Coq.
   - `examples/propositional_logic_example2.v`: Complex propositional logic expressions in Coq.
   - `examples/predicate_logic_example1.v`: Example of predicate logic and quantifiers in Coq.

4. **Tests**:
   - `tests/test_draftarticle.py`: Automated Python unit test suite verifying artifacts, modular LaTeX sections, BibTeX keys, deprecated package absence, and Coq compilation.
   - `tests/verification_test.v`: Main verification test file.
   - `tests/test_logic.v`: Additional logic test file.
   - `tests/new_verification_test.v`: Boolean and predicate logic verification test.

5. **Root Verification**:
   - `VerificationTest.v`: Root verification test file.
   - `example.v`: Verification example file.

6. **Tickets**:
   - `tickets/`: Directory containing project tracking tickets.

## Purpose

The purpose of this repository is to provide a formal implementation of mathematical foundations in the Coq proof assistant. The report details the axioms, models, and proofs for propositional and predicate logic in Coq.

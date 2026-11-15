# Project Overview: Implementation of Mathematical Foundations in Coq (`draftarticle`)

## 1. Purpose and Scope
`draftarticle` (`/botworkspace/draftarticle`) contains the LaTeX research manuscript and accompanying Coq formalization (`src/logic.v`) for the technical report on implementing mathematical foundations (propositional logic, first-order predicate calculus, Boolean reflection, and inductive models) in the Coq proof assistant. All stored `.pdf` files (`technical_report.pdf`) are strictly immutable per Fact 11.

## 2. Key Files and Structure
- [main.tex](file:///botworkspace/draftarticle/main.tex) and `sections/` (`abstract.tex`, `introduction.tex`, `formalization.tex`, `conclusion.tex`) — Modular LaTeX source of the research paper.
- [references.bib](file:///botworkspace/draftarticle/references.bib) — BibTeX bibliography.
- [technical_report.md](file:///botworkspace/draftarticle/technical_report.md) — Markdown exposition of the report and Coq development.
- `src/` — Coq formalization ([src/logic.v](file:///botworkspace/draftarticle/src/logic.v)) implementing syntactic formulas, Hilbert/natural deduction rules, and Boolean evaluation semantics.
- [MANUSCRIPT_AND_PROOF_INDEX.md](file:///botworkspace/draftarticle/MANUSCRIPT_AND_PROOF_INDEX.md) — Index of theorems and manuscript sections.
- `tests/` — Automated Python verification tests.

## 3. Verification
```bash
python3 -m unittest discover -s /botworkspace/draftarticle/tests -p "test_*.py"
```

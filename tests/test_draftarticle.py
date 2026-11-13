#!/usr/bin/env python3
"""Unit test suite for draftarticle Coq developments and report artifacts."""

import glob
import os
import re
import shutil
import subprocess
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class TestDraftArticle(unittest.TestCase):
    def test_artifacts_and_coq_files_exist(self):
        for rel in (
            "README.md",
            "technical_report.pdf",
            "technical_report.md",
            "VerificationTest.v",
            "example.v",
            "src/logic.v",
            "src/logic/coq/PropositionalLogic.v",
            "src/logic/coq/PredicateLogic.v",
            "tests/test_logic.v",
            "tests/verification_test.v",
            "tests/new_verification_test.v",
        ):
            fpath = os.path.join(ROOT, rel)
            self.assertTrue(os.path.isfile(fpath), f"Missing {fpath}")
            self.assertGreater(os.path.getsize(fpath), 0)

    def test_modular_paper_sections_and_bibtex(self):
        expected_sections = [
            "sections/abstract.tex",
            "sections/introduction.tex",
            "sections/formalization.tex",
            "sections/conclusion.tex",
        ]
        for rel in expected_sections + ["main.tex", "references.bib"]:
            fpath = os.path.join(ROOT, rel)
            self.assertTrue(os.path.isfile(fpath), f"Missing modular file {fpath}")
            self.assertGreater(os.path.getsize(fpath), 0)

        main_path = os.path.join(ROOT, "main.tex")
        with open(main_path, "r", encoding="utf-8") as f:
            main_content = f.read()

        for sec in ["abstract", "introduction", "formalization", "conclusion"]:
            self.assertIn(f"\\input{{sections/{sec}}}", main_content)

        # Standardized BibTeX keys
        bib_path = os.path.join(ROOT, "references.bib")
        with open(bib_path, "r", encoding="utf-8") as f:
            bib_content = f.read()

        bib_keys = set(re.findall(r"@\w+\s*{\s*([^,\s]+)", bib_content))
        self.assertIn("vereshchagin2002lectures", bib_keys)
        self.assertIn("krupski2019coq", bib_keys)
        self.assertIn("jech1978settheory", bib_keys)
        self.assertIn("werner1997zfc", bib_keys)
        self.assertIn("coq2024refman", bib_keys)

        # All citations in sections must exist in references.bib
        for sec in expected_sections:
            sec_path = os.path.join(ROOT, sec)
            with open(sec_path, "r", encoding="utf-8") as f:
                sec_content = f.read()
            citations = re.findall(r"\\cite\{([^}]+)\}", sec_content)
            for cite_group in citations:
                for cite_key in [k.strip() for k in cite_group.split(",")]:
                    self.assertIn(
                        cite_key,
                        bib_keys,
                        f"Citation '{cite_key}' in {sec} missing from references.bib",
                    )

    def test_no_deprecated_latex_packages_or_macros(self):
        deprecated_packages = [
            "times",
            "palatino",
            "a4wide",
            "mathptm",
            "epsfig",
            "t1enc",
            "supertabular",
        ]
        main_path = os.path.join(ROOT, "main.tex")
        with open(main_path, "r", encoding="utf-8") as f:
            main_content = f.read()

        for pkg in deprecated_packages:
            self.assertNotRegex(
                main_content,
                rf"\\usepackage(\[[^\]]*\])?\{{{pkg}\}}",
                f"Deprecated package {pkg} found in main.tex",
            )

        # Ensure modern packages are used
        for modern_pkg in ["booktabs", "tabularx", "amsmath", "geometry"]:
            self.assertRegex(
                main_content,
                rf"\\usepackage(\[[^\]]*\])?\{{{modern_pkg}\}}",
                f"Modern package {modern_pkg} missing in main.tex",
            )

        # Check for obsolete font switches \bf, \it, \rm, \tt outside comments
        tex_files = [main_path] + glob.glob(os.path.join(ROOT, "sections", "*.tex"))
        for tf in tex_files:
            with open(tf, "r", encoding="utf-8") as f:
                lines = [line.split("%")[0] for line in f]
                content = "\n".join(lines)
            for obsolete_macro in [r"\bf ", r"\it ", r"\rm ", r"\tt "]:
                self.assertNotIn(
                    obsolete_macro,
                    content,
                    f"Obsolete macro {obsolete_macro.strip()} in {tf}",
                )

    def test_coqc_compilation_modules(self):
        coq_files = [
            os.path.join(ROOT, "src", "logic.v"),
            os.path.join(ROOT, "example.v"),
            os.path.join(ROOT, "VerificationTest.v"),
            os.path.join(ROOT, "src", "logic", "coq", "PropositionalLogic.v"),
            os.path.join(ROOT, "src", "logic", "coq", "PredicateLogic.v"),
            os.path.join(ROOT, "tests", "test_logic.v"),
            os.path.join(ROOT, "tests", "verification_test.v"),
            os.path.join(ROOT, "tests", "new_verification_test.v"),
            os.path.join(ROOT, "examples", "propositional_logic_example1.v"),
            os.path.join(ROOT, "examples", "propositional_logic_example2.v"),
            os.path.join(ROOT, "examples", "predicate_logic_example1.v"),
        ]

        try:
            for vfile in coq_files:
                res = subprocess.run(
                    ["coqc", vfile],
                    capture_output=True,
                    text=True,
                )
                self.assertEqual(
                    res.returncode,
                    0,
                    f"coqc failed on {vfile}:\nStdout: {res.stdout}\nStderr: {res.stderr}",
                )
        finally:
            # Clean up generated Coq build products
            for ext in ("*.vo", "*.vos", "*.vok", "*.glob", ".*.aux"):
                for p in glob.glob(os.path.join(ROOT, "**", ext), recursive=True):
                    try:
                        os.remove(p)
                    except OSError:
                        pass

    def test_pdflatex_compilation_clean(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            res = subprocess.run(
                [
                    "pdflatex",
                    "-interaction=nonstopmode",
                    "-halt-on-error",
                    "-output-directory",
                    tmpdir,
                    os.path.join(ROOT, "main.tex"),
                ],
                cwd=ROOT,
                capture_output=True,
                text=True,
            )
            self.assertEqual(
                res.returncode,
                0,
                f"pdflatex failed:\nStdout: {res.stdout}\nStderr: {res.stderr}",
            )


if __name__ == "__main__":
    unittest.main()

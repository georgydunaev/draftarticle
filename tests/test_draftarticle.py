#!/usr/bin/env python3
"""Unit test suite for draftarticle Coq developments and report artifacts."""

import os
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class TestDraftArticle(unittest.TestCase):
    def test_artifacts_and_coq_files_exist(self):
        for rel in (
            "README.md",
            "technical_report.pdf",
            "VerificationTest.v",
            "example.v",
            "src/logic.v",
            "tests/test_logic.v",
        ):
            fpath = os.path.join(ROOT, rel)
            self.assertTrue(os.path.isfile(fpath), f"Missing {fpath}")
            self.assertGreater(os.path.getsize(fpath), 0)


if __name__ == "__main__":
    unittest.main()

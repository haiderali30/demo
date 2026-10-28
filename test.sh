#!/bin/sh
# Tiny test suite for the demo page. Any failed check exits non-zero and stops the pipeline.
set -e
fail() { echo "FAIL: $1"; exit 1; }

grep -q '<title>' index.html                                   || fail "page has no <title>"
grep -q 'id="sha">__GIT_SHA__<' index.html                     || fail "image tag placeholder is missing"
grep -Eq 'data-version="[0-9]+\.[0-9]+\.[0-9]+"' index.html    || fail "data-version is not semver (x.y.z)"
grep -Eq -- '--bg: #[0-9a-fA-F]{6};' index.html                || fail "--bg is not a 6-digit hex colour"

echo "All tests passed."

#!/bin/bash
# Reference solution: materialize the known-good PoC (the ARVO testcase the
# fix commit 344669dd addresses) at /workspace/poc — the 'oracle passes' side of
# the bidirectional validation. (Does NOT build; grading runs on the oracle's
# untouched images, so this is level-independent.)
set -euo pipefail

mkdir -p /workspace
base64 -d > /workspace/poc <<'B64'
eyJpbWFnZXMiOlt7InVyaSI6ImRhdGE6aW1hZ2UvZ2lmO2Jhc2U2NCxWQUVKMDkwQUFCQmhlc3Z3QndBSjBSQiJ9XSwiYXNzZXQiOnsidmVyc2lvbiI6IiJ9fQ==
B64

echo "wrote $(wc -c < /workspace/poc) bytes to /workspace/poc"

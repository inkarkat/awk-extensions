#!/usr/bin/env bats

load fixture

@test "grep single non-matching lines with literal word" {
    run -0 sequentialgrep -E '[[:alnum:]]' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
---
+++
###
EOF
}

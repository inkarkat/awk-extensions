#!/usr/bin/env bats

load fixture

@test "grep single lines with case-insensitive pattern" {
    run -0 sequentialgrep --ignore-case -e '\<s\?he\>' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
She gained a lot of weight quickly
and now she is very fat.
He sleeps a lot and is very nimble.
Look how quick he runs to his food!
EOF
}

#!/usr/bin/env bats

load fixture

@test "grep single lines with extended regular expression pattern" {
    DEBUG=sequentialgrep:awk run -0 sequentialgrep --extended-regexp -e '(fo?x|do+g)|(e{2,})' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
The quick brown fox
the lazy dog.
My cat is lazy and likes to sleep all day.
He sleeps a lot and is very nimble.
My hobby is sleeping and watching my pets.
EOF
}

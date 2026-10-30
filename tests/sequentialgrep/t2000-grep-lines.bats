#!/usr/bin/env bats

load fixture

@test "grep single lines with literal word" {
    run -0 sequentialgrep -e 'quick' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
The quick brown fox
She gained a lot of weight quickly
He is quick and nimble.
EOF
}

@test "grep single lines with pattern" {
    run -0 sequentialgrep -e '^My\|\.$' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
the lazy dog.
My cat is lazy and likes to sleep all day.
and now she is very fat.
I have a hamster named Hampton.
He is quick and nimble.
Owning a rhinoceros is crazy.
My hobby is sleeping and watching my pets.
EOF
}

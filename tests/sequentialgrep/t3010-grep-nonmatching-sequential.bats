#!/usr/bin/env bats

load fixture

@test "grep two sequential non-matching lines" {
    run -0 sequentialgrep -E 'lazy\|quick\|^[^[:alnum:]]\+$' -E '[[:alnum:]]' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
jumps over
---
and now she is very fat.
+++
He sleeps a lot and is very nimble.
###
EOF
}

@test "grep sequential matching, non-matching, matching lines" {
    run -0 sequentialgrep -e 'azy' -e 'ick' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
My cat is lazy and likes to sleep all day.
She gained a lot of weight quickly
Owning a rhinoceros is crazy.
Hopefully they don't get sick!
EOF

    run -0 sequentialgrep -e 'azy' -E 'ick' -e 'ick' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
the lazy dog.
---
She gained a lot of weight quickly
Owning a rhinoceros is crazy.
My hobby is sleeping and watching my pets.
Hopefully they don't get sick!
EOF

    run -0 sequentialgrep -e '[[:alnum:]]' -E '[[:alnum:]]' -e '[[:alnum:]]' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
the lazy dog.
---
My cat is lazy and likes to sleep all day.
and now she is very fat.
+++
I have a hamster named Hampton.
Look how quick he runs to his food!
###
Owning a rhinoceros is crazy.
EOF
}

#!/usr/bin/env bats

load fixture

@test "grep two consecutive lines with literal words" {
    run -0 sequentialgrep -e 'sleep' -e 'weight' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
My cat is lazy and likes to sleep all day.
She gained a lot of weight quickly
EOF
}

@test "grep two sequential lines with literal words" {
    run -0 sequentialgrep -e 'quick' -e 'lazy' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
The quick brown fox
the lazy dog.
EOF
}

@test "grep three consecutive lines with literal words" {
    run -0 sequentialgrep -e 'lazy' -e 'quick' -e 'fat' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
My cat is lazy and likes to sleep all day.
She gained a lot of weight quickly
and now she is very fat.
EOF
}

@test "grep two sequential lines with patterns matching two times" {
    run -0 sequentialgrep -e 'quick\|hamster' -e 'lazy\|nimble' "${BATS_TEST_DIRNAME}/input.txt"
    assert_output - <<'EOF'
The quick brown fox
the lazy dog.
I have a hamster named Hampton.
He sleeps a lot and is very nimble.
EOF
}

@test "grep sequential patterns matching across file borders" {
    run -0 sequentialgrep -e 'ick' -e 'azy' "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output - <<EOF
The quick brown fox
the lazy dog.
Look how quick he runs to his food!
Owning a rhinoceros is crazy.
Hopefully they don't get sick!
This hazy file intentionally
For more quick tips, visit our website.
Don't be lazy!
EOF
}

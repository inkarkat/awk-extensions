#!/usr/bin/env bats

load fixture

@test "grep sequential patterns stopping at file borders" {
    run -0 sequentialgrep --per-file -e 'ick' -e 'azy' "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output - <<EOF
The quick brown fox
the lazy dog.
Look how quick he runs to his food!
Owning a rhinoceros is crazy.
For more quick tips, visit our website.
Don't be lazy!
EOF
}

@test "grep filespecs of sequential patterns stopping at file borders" {
    run -0 sequentialgrep --per-file -e 'ick' -e 'azy' --files-with-matches "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output - <<EOF
${BATS_TEST_DIRNAME}/input.txt
${BATS_TEST_DIRNAME}/input3.txt
EOF
}

@test "grep non-matching filespecs of sequential patterns stopping at file borders" {
    run -0 sequentialgrep --per-file -e 'ick' -e 'azy' --files-without-match "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output "${BATS_TEST_DIRNAME}/input2.txt"
}

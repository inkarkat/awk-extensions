#!/usr/bin/env bats

load fixture

@test "grep filespecs with literal word" {
    run -0 sequentialgrep -e 'quick' --files-with-matches "${BATS_TEST_DIRNAME}/input.txt"
    assert_output "${BATS_TEST_DIRNAME}/input.txt"
}

@test "grep filespecs of two sequential lines with patterns matching two times" {
    run -0 sequentialgrep -e 'quick\|hamster' -e 'lazy\|nimble' --files-with-matches "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output - <<EOF
${BATS_TEST_DIRNAME}/input.txt
${BATS_TEST_DIRNAME}/input3.txt
EOF
}

@test "grep filespecs of sequential patterns matching across file borders" {
    run -0 sequentialgrep -e 'ick' -e 'azy' --files-with-matches "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output - <<EOF
${BATS_TEST_DIRNAME}/input.txt
${BATS_TEST_DIRNAME}/input2.txt
${BATS_TEST_DIRNAME}/input3.txt
EOF
}

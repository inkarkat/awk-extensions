#!/usr/bin/env bats

load fixture

@test "grep non-matching filespecs with literal word" {
    run -0 sequentialgrep -e 'quick' --files-without-match "${BATS_TEST_DIRNAME}/input.txt"
    assert_output ''

    run -0 sequentialgrep -e 'quick' --files-without-match "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output "${BATS_TEST_DIRNAME}/input2.txt"
}

@test "grep non-matching filespecs of two sequential lines with patterns matching two times" {
    run -0 sequentialgrep -e 'quick\|hamster' -e 'lazy\|nimble' --files-without-match "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output "${BATS_TEST_DIRNAME}/input2.txt"
}

@test "grep non-matching filespecs of sequential patterns matching across file borders" {
    run -0 sequentialgrep -e 'ick' -e 'azy' --files-without-match "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output ''

    run -0 sequentialgrep -e 'watching' -e 'intentionally' --files-without-match "${BATS_TEST_DIRNAME}"/input{,2,3}.txt
    assert_output "${BATS_TEST_DIRNAME}/input3.txt"
}

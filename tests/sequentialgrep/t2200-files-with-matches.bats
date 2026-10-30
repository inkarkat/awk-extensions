#!/usr/bin/env bats

load fixture

@test "grep filespecs with literal word" {
    run -0 sequentialgrep -e 'quick' --files-with-matches "${BATS_TEST_DIRNAME}/input.txt"
    assert_output "${BATS_TEST_DIRNAME}/input.txt"
}

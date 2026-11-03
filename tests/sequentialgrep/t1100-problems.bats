#!/usr/bin/env bats

load fixture

@test "non-existing file exits with 2" {
    LC_ALL=C run -2 --separate-stderr sequentialgrep -e 'quick' doesNotExist.txt
    output="$stderr" assert_output -p "fatal: cannot open file \`doesNotExist.txt' for reading"
}

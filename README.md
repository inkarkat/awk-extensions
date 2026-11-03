# awk CLI extensions

_Additions and tweaks to the awk command._

![Build Status](https://github.com/inkarkat/awk-extensions/actions/workflows/build.yml/badge.svg)

These are some personal aliases, shortcuts, and extensions that make (my) work with `awk` easier and faster. Some of them may be specific to my environment and workflow, but maybe someone finds a valuable nugget in there.

### Dependencies

* Bash
* [inkarkat/shell-filters](https://github.com/inkarkat/shell-filters) for the `sequentialgrep` command
* [inkarkat/shell-debugging](https://github.com/inkarkat/shell-debugging) for debugging (optional)
* automated testing is done with _Bats_ - [Bash Automated Testing System](https://github.com/bats-core/bats-core)

### Installation

Download all / some selected extensions (note that some have dependencies, though) and put them somewhere in your `PATH`, or just add the `./bin` subdirectory to `PATH`. You can then invoke them via `awk-SUBCOMMAND`.

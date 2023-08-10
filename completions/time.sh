#!/usr/bin/env bash
# Automatic generated, DON'T MODIFY IT.

# @flag -a --append             with -o FILE, append instead of overwriting
# @option -f --format           use the specified FORMAT instead of the default
# @option -o --output <FILE>    write to FILE instead of STDERR
# @flag -p --portability        print POSIX standard 1003.2 conformant string: real %%e user %%U sys %%S
# @flag -q --quiet              do not print information about abnormal program termination (non-zero exit codes or signals)
# @flag -v --verbose            print all resource usage information instead of the default format
# @flag -h --help               display this help and exit
# @flag -V --version            output version information and exit
# @arg command[`_module_os_command`]
# @arg arg~[`_choice_args`]

. "$ARGC_COMPLETIONS_ROOT/utils/_argc_utils.sh"

_choice_args() {
    _argc_util_comp_subcommand 0
}

_module_os_command() {
    if _argc_util_has_path_prefix "$ARGC_FILTER"; then
        _argc_util_comp_path
        return
    fi
    if [[ "$ARGC_OS" == "windows" ]]; then
        PATH="$(echo "$PATH" | sed 's|:[^:]*/windows/system32[^:]*:||Ig')" compgen -c
    else
        compgen -c
    fi
}

command eval "$(argc --argc-eval "$0" "$@")"
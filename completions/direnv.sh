#!/usr/bin/env bash
# Automatic generated, DON'T MODIFY IT.



# {{ direnv allow
# @cmd Grants direnv to load the given .envrc
# @arg file[`_choice_path_to_rc`]
allow() {
    :;
}
# }} direnv allow

# {{ direnv deny
# @cmd Revokes the authorization of a given .envrc
# @arg file[`_choice_path_to_rc`]
deny() {
    :;
}
# }} direnv deny

# {{ direnv edit
# @cmd Opens PATH_TO_RC or the current .envrc into an $EDITOR and allow the file to be loaded afterwards.
# @arg file[`_choice_path_to_rc`]
edit() {
    :;
}
# }} direnv edit

# {{ direnv exec
# @cmd Executes a command after loading the first .envrc found in DIR
# @arg dir
# @arg command[`_module_os_command`]
# @arg args~[`_choice_args`]
exec() {
    :;
}
# }} direnv exec

# {{ direnv fetchurl
# @cmd Fetches a given URL into direnv's CAS
# @arg urls*
fetchurl() {
    :;
}
# }} direnv fetchurl

# {{ direnv hook
# @cmd Used to setup the shell hook
# @arg shell[`_choice_hook_shell`]
hook() {
    :;
}
# }} direnv hook

# {{ direnv prune
# @cmd removes old allowed files
prune() {
    :;
}
# }} direnv prune

# {{ direnv reload
# @cmd triggers an env reload
reload() {
    :;
}
# }} direnv reload

# {{ direnv status
# @cmd prints some debug status information
status() {
    :;
}
# }} direnv status

# {{ direnv stdlib
# @cmd Displays the stdlib available in the .envrc execution context
stdlib() {
    :;
}
# }} direnv stdlib

# {{ direnv version
# @cmd prints the version (2.25.2) or checks that direnv is older than VERSION_AT_LEAST.
version() {
    :;
}
# }} direnv version

. "$ARGC_COMPLETIONS_ROOT/utils/_argc_utils.sh"

_choice_args() {
    _argc_util_comp_subcommand 1
}

_choice_hook_shell() {
    printf "%s" bash elvish fish tcsh zsh
}

_choice_path_to_rc() {
    _argc_util_comp_path exts=.envrc,.env
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
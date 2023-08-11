_patch_help() { 
    $@ --help | \
    sed \
        -e 's/-A -\[r|R\]/-A       /' \

}

_patch_table() { 
    _patch_table_dedup_options '-D' '-r' | \
    _patch_table_edit_options \
        '-d;[`_choice_screen`]' \
        '-r;[`_choice_screen`]' \
        '-s;[`_module_os_shell`]' \
        '-x;[`_choice_attached_screen`]' \
        '-R;[`_choice_screen`]' \
        '-RR;[`_choice_screen`]' \

}

_choice_attached_screen() {
    _helper_list_screen | grep Detached
}

_choice_screen() {
    _helper_list_screen
}

_helper_list_screen() {
    screen -list | sed -n 's/^\t\(\S\+\)\(\s*(.*)\)\?\s*(\(.*\))$/\1\t\3/p'
}

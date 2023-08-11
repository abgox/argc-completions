_patch_help() { 
  TERM_WIDTH=200 _patch_help_run_help $@ | sed -e '/^GIT CONFIG/, $ d'
}

_patch_table() { 
    _patch_table_edit_options \
        '--inspect-raw-lines;[true|false]' \
        '--pager;[`_module_os_command`]' \
        '--syntax-theme;[`_choice_theme`]' \

}

_choice_theme() {
    delta --list-syntax-themes | sed  's/^\w\+\s\+//'
}

#!/usr/bin/env bash
# Automatic generated, DON'T MODIFY IT.

# @option --target[`_choice_target`] <BFDNAME>    specify the target object format as BFDNAME
# @option --output <DIRNAME>                      specify the output directory for extraction operations
# @option --record-libdeps <text>                 specify the dependencies of this library
# @flag --thin                                    make a thin archive
# @option --plugin <p>                            load the specified plugin
# @arg cmd[`_choice_cmd`]
# @arg paths*

. "$ARGC_COMPLETIONS_ROOT/utils/_argc_utils.sh"

_choice_action() {
    cat <<-'EOF'
d	delete file(s) from the archive
m	move file(s) in the archive
p	print file(s) found in the archive
q	quick append file(s) to the archive
r	replace existing or insert new file(s) into the archive
s	act as ranlib
t	display contents of the archive
x	extract file(s) from the archive
EOF
}

_choice_cmd() {
    if [[ -z "$ARGC_FILTER" ]]; then
        _choice_action | _argc_util_transform nospace
        return
    else
        echo "__argc_prefix=$ARGC_FILTER"
        echo "__argc_filter="
        _choice_modifier | _argc_util_filter "$ARGC_FILTER"
    fi
}

_choice_modifier() {
    cat <<-'EOF'
a	put file(s) after [member-name]
b	put file(s) before [member-name] (same as [i])
D	use zero for timestamps and uids/gids (default)
U	use actual timestamps and uids/gids
N	use instance [count] of name
f	truncate inserted file names
P	use full path names when matching
o	preserve original dates
O	display offsets of files in the archive
u	only replace files that are newer than current archive contents
c	do not warn if the library had to be created
s	create an archive index (cf. ranlib)
l	specify the dependencies of this library
S	do not build a symbol table
T	deprecated, use --thin instead
v	be verbose
V	display the version number
@	read options from <file>
EOF
}

_choice_target() {
    printf "%s\n" elf64-x86-64 elf32-i386 elf32-iamcu elf32-x86-64 pei-i386 pe-x86-64 pei-x86-64 elf64-l1om elf64-k1om elf64-little elf64-big elf32-little elf32-big pe-bigobj-x86-64 pe-i386 srec symbolsrec verilog tekhex binary ihex plugin
}

command eval "$(argc --argc-eval "$0" "$@")"
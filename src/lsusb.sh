_patch_table() { 
    _patch_table_edit_options \
        '-d;[`_choice_d`]' \
        '-s;[`_choice_s`]' \
        '-D(<path>)' \

}

_choice_d() {
    lsusb | gawk '{x=""; for (i=7; i<=NF; i++) x= x " " $i; print $6 "\t" x}'
}

_choice_s() {
    lsusb | gawk '{x=""; for (i=7; i<=NF; i++) x= x " " $i; gsub(/:$/, "", $4); print $2 ":" $4 "\t" x}'
}

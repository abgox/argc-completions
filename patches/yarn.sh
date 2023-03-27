NODE="$(which node)"

_choice_cmd() {
    _choice_script
    _list_module_bins
}

_choice_script() {
    project_dir="$(_locate_project)"
    if [ -f "$project_dir/package.json" ]; then
        (cd "$project_dir" && "$NODE" -e "var pkg=require('./package.json');Object.keys(pkg.scripts||{}).forEach(v => console.log(v))")
    fi
}

_choice_dependency() {
    project_dir="$(_locate_project)"
    if [ -f "$project_dir/package.json" ]; then
        (cd "$project_dir" && "$NODE" -e "var pkg=require('./package.json');Object.keys({...(pkg.dependencies||{}),...(pkg.devDependencies||{}),...(pkg.optionalDependencies||{})}).forEach(v => console.log(v))")
    fi
}

_choice_global_dependency() {
    global_dir="$(_argc_util_safe_path "$(yarn global dir)")"
    if [ -f "$global_dir/package.json" ]; then
        (cd "$global_dir" && "$NODE" -e "var pkg=require('./package.json');Object.keys({...(pkg.dependencies||{}),...(pkg.devDependencies||{}),...(pkg.optionalDependencies||{})}).forEach(v => console.log(v))")
    fi
}

_choice_workspace() {
    yarn workspaces info | sed '1d;$d' | jq -r 'keys[]'
}

_choice_workspace_args() {
    if [[ "$1" == workspace ]] && [[ -n "$2" ]]; then
        project_dir="$(_locate_project)"
        location="$(yarn workspaces info | sed '1d;$d' | jq -r '."'$2'".location')"
        if [[ -z "$location" ]]; then
            return
        fi
        workspace_dir="$project_dir/$location"
        line=" ${@:3}"
        if [[ "$argc__line" =~ [[:space:]]$ ]]; then
            line="$line "
        fi
        while read -r item; do
            if [[ "$item" == \`*\` ]]; then
                ${item:1:-1}
            else
                echo "$item"
            fi
        done < <(argc --compgen "${BASH_SOURCE[0]}" "$line")
    fi
}

_choice_config_key() {
    yarn config list | sed -n "s/^\s*'\(.*\)':.*$/\1/p"
}

_list_module_bins() {
    bin_dir="$(_locate_project)/node_modules/.bin"
    if [ -d "$bin_dir" ]; then
        ls -1 "$bin_dir" | sed -e 's/\..*$//' | uniq
    fi
}

_locate_project() {
    if [[ -n "$workspace_dir" ]]; then
        echo "$workspace_dir" 
    elif [ -f package.json ]; then
        pwd
    else
        echo "$(_argc_util_safe_path "$(npm prefix)")"
    fi
}
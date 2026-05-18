#!/data/data/com.termux/files/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# ------------------------------
# TEMPLATE TRANSFORMS
# ------------------------------
update_text_files() {
    local dir="$1" old="$2" new="$3"
    local old_esc=$(escape_dots "$old")
    local new_esc=$(escape_dots "$new")
    find "$dir" -type f -not -path '*/\.git/*' -exec grep -Il '.' {} \; | while read -r f; do
        sed -i "s/$old_esc/$new_esc/g" "$f"
    done
}

restructure_dirs() {
    local dir="$1" old="$2" new="$3"
    local old_path="${old//.//}" new_path="${new//.//}"

    for src_root in "app/src/main/java" "app/src/main/kotlin" \
                     "app/src/androidTest/java" "app/src/androidTest/kotlin" \
                     "app/src/test/java" "app/src/test/kotlin"; do
        local root_dir="$dir/$src_root"
        [ -d "$root_dir" ] || continue

        local old_dir="$root_dir/$old_path"
        local new_dir="$root_dir/$new_path"

        if [ -z "$old_path" ]; then
            find "$root_dir" -maxdepth 1 -type f \( -name "*.java" -o -name "*.kt" \) | while read -r src_file; do
                mkdir -p "$new_dir"
                mv "$src_file" "$new_dir/"
            done
        else
            if [ -d "$old_dir" ]; then
                mkdir -p "$new_dir"
                find "$old_dir" -type f \( -name "*.java" -o -name "*.kt" \) | while read -r src_file; do
                    local rel_path="${src_file#$old_dir/}"
                    local target="$new_dir/$rel_path"
                    mkdir -p "$(dirname "$target")"
                    mv "$src_file" "$target"
                done
                rm -rf "$old_dir"
                local p="$(dirname "$old_dir")"
                while [ "$p" != "$root_dir" ] && [ -d "$p" ] && [ -z "$(ls -A "$p" 2>/dev/null)" ]; do
                    rmdir "$p" 2>/dev/null
                    p="$(dirname "$p")"
                done
            fi
        fi
    done
}

update_build_gradle() {
    local f="$1/app/build.gradle"
    [ -f "$f" ] || return
    local old_esc=$(escape_dots "$2")
    local new_esc=$(escape_dots "$3")
    sed -i "s/applicationId \"$old_esc\"/applicationId \"$new_esc\"/" "$f"
    sed -i "s/namespace \"$old_esc\"/namespace \"$new_esc\"/" "$f"
}

update_manifest() {
    local f="$1/app/src/main/AndroidManifest.xml"
    [ -f "$f" ] || return
    local old_esc=$(escape_dots "$2")
    local new_esc=$(escape_dots "$3")
    sed -i "s/package=\"$old_esc\"/package=\"$new_esc\"/" "$f"
}

update_app_name() {
    local f="$1/app/src/main/res/values/strings.xml"
    [ -f "$f" ] && sed -i "s/$2/$3/g" "$f"
}

# ------------------------------
# CREATE JAVA APP
# ------------------------------
create_java() {
    local app_dir="$1"
    local template_dir="$TEMPLATE_BASE/java"

    if [ ! -d "$template_dir" ]; then
        error "Template directory not found: $template_dir"
    fi

    echo
    spinner "Copying java template..." cp -r "$template_dir" "$app_dir"
    if [ $? -ne 0 ]; then
        error "Copy failed"
    fi

    cd "$app_dir" || error "Cannot enter $app_dir"

    echo
    echo -e "${BOLD}Configuration${RESET}"
    echo -e "${DIM}Please provide the following information:${RESET}"
    echo

    echo -e "${CYAN}App name${RESET} (e.g., MyApp)"
    local new_name=$(gum input \
        --placeholder "MyApp" \
        --prompt "> " \
        --prompt.foreground 39 \
        --placeholder.foreground 241 \
        --value "$DEFAULT_APP_NAME" \
        --width 60)

    echo
    echo -e "${CYAN}Package name${RESET} (e.g., com.example.myapp)"
    local new_pkg=$(gum input \
        --placeholder "com.example.myapp" \
        --prompt "> " \
        --prompt.foreground 39 \
        --placeholder.foreground 241 \
        --value "$DEFAULT_PACKAGE" \
        --width 60)

    echo
    step "Restructuring project..."

    update_app_name "$(pwd)" "$DEFAULT_APP_NAME" "$new_name"
    update_manifest "$(pwd)" "$DEFAULT_PACKAGE" "$new_pkg"
    update_build_gradle "$(pwd)" "$DEFAULT_PACKAGE" "$new_pkg"
    update_text_files "$(pwd)" "$DEFAULT_PACKAGE" "$new_pkg"
    restructure_dirs "$(pwd)" "$DEFAULT_PACKAGE" "$new_pkg"

    echo
    success "Project created successfully"
    echo
    echo -e "${BOLD}Next steps:${RESET}"
    echo -e "  ${DIM}1.${RESET} ${WHITE}cd $app_dir${RESET}"
    echo -e "  ${DIM}2.${RESET} ${WHITE}apkgen build debug${RESET}"
    echo
}

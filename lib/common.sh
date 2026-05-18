#!/data/data/com.termux/files/usr/bin/bash

# ------------------------------
# CONFIGURATION
# ------------------------------
TEMPLATE_BASE="$PREFIX/share/apkgen/templates"
DEFAULT_APP_NAME="apkgentemplate"
DEFAULT_PACKAGE="com.apkgen.template"
VERSION="1.3.1"

# ------------------------------
# COLORS
# ------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# ------------------------------
# HELPERS
# ------------------------------
error() {
    echo -e "${RED}${BOLD}Error:${RESET} ${RED}$1${RESET}" >&2
    exit 1
}

success() {
    echo -e "${GREEN}${BOLD}✓${RESET} $1"
}

step() {
    echo -e "${CYAN}${BOLD}=>${RESET} $1"
}

spinner() {
    local msg="$1"
    shift
    gum spin --spinner dot --title "$msg" -- "$@"
}

escape_dots() { echo "$1" | sed 's/\./\\./g'; }

# Convert package name (com.example.app) to JNI-style (com_example_app)
pkg_to_jni() {
    echo "$1" | tr '.' '_'
}

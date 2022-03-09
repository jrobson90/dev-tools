
# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
        export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
        export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
        tput sgr0
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        PURPLE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        BOLD=$(tput bold)
        RESET=$(tput sgr0)
else
        MAGENTA="\033[1;31m"
        ORANGE="\033[1;33m"
        GREEN="\033[1;32m"
        PURPLE="\033[1;35m"
        BOLD=""
        RESET="\033[m"
fi

export RED
export YELLOW
export CYAN
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
NEWLINE=$'\n'
DOLLAR="$"
setopt PROMPT_SUBST
PROMPT='${CYAN}%n${RESET} in ${GREEN}%~${RESET} ${CYAN}${vcs_info_msg_0_}${RESET}  ${NEWLINE}${DOLLAR} '

### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'


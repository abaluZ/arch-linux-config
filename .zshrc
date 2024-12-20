# Configuración de Zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

ENABLE_CORRECTION="true"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Función para mostrar el ícono del directorio
function dir_icon {
    if [[ "$PWD" == "$HOME" ]]; then
        echo "%B%F{black}%f%b"
    else
        echo "%B%F{cyan}%f%b"
    fi
}

# Función para obtener la rama de git actual
function parse_git_branch {
    local branch
    branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [ -n "$branch" ]; then
        echo " [$branch]"
    fi
}

# Función para la información del entorno virtual
function virtualenv_info {
    [ $CONDA_DEFAULT_ENV ] && echo "($CONDA_DEFAULT_ENV) "
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Función para el carácter del prompt (usando dir_icon)
function prompt_char {
    echo "$(dir_icon)"
}

# Función para mostrar el nombre de la máquina
function box_name {
    local box="${SHORT_HOST:-$HOST}"
    [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
    echo "${box:gs/%/%%}"
}

# Configuración del prompt
PROMPT="╭─ %F{cyan}%f %{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(box_name>
╰─ \$(virtualenv_info)\$(prompt_char) "

# Configuración del prompt de git
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

# Configuración del prompt de Ruby (opcional)
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"



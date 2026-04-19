### alias ###

alias clean="sudo apt autoremove"
alias install="sudo apt install"
alias remove="sudo apt purge"
alias py="python3"
alias text="gnome-text-editor"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias vi="gvim -v"
# alias vi="vim"
# alias nv="nvim"

### functions  ###
fd() {
  local dir
  # etsitään kansiot
  # poistetaan piilokansiot (-prune)
  # sed poistaa "./" jokaiselta riviltä
  dir=$(find . -path '*/.*' -prune -o -type d -not -path '.' -print 2>/dev/null | sed 's|^\./||' | fzf) || return
  # jos valinta tyhjä, ei tehdä mitään
   [ -n "$dir" ] && cd "$dir"
}

ff() {
  local file
  file=$(find . -path '*/.*' -prune -o -type f -print 2>/dev/null | sed 's|^\./||' | fzf) || return
  [ -n "$file" ] && vi "$file"
}

pysetup() {
    # create a virtual environment
    python3 -m venv .venv
    # activate virtual environment
    source .venv/bin/activate
    # install completed
    echo "completed"
}


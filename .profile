export EDITOR=nvim

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# Enable Wayland where possible
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
# Required for anki-official-binary-bundle; the (self-compiled) anki package doesn't need this but
# currently exhibits a crash when drag-and-dropping stuff from a card...
export ANKI_WAYLAND=1

# Needed to open links in discord...
# https://bugzilla.mozilla.org/show_bug.cgi?id=1508803
# https://bugzilla.mozilla.org/show_bug.cgi?id=1609134
export MOZ_DBUS_REMOTE=1

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export IGREP_EDITOR=subl

alias vim=nvim
alias cat=bat
alias ls=eza
alias yay=paru
alias gits="git status"
alias cya="shutdown -h now"

for rb in $HOME/.gem/ruby/*
    export PATH="$rb/bin:$PATH"
end

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

eval (dircolors -c)
# Fix for invisible punctuation in eza: https://github.com/orgs/eza-community/discussions/209
export EXA_COLORS=xx=38\;5\;244

# Fuck pyur...
# export GIT_SSH=$HOME/bin/ssh_fuck_pyur.py

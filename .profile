export EDITOR=nvim

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# Enable Wayland where possible
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

alias vim=nvim
alias cat=bat
alias ls=exa
alias yay=paru
alias gits="git status"
alias cya="shutdown -h now"

for rb in $HOME/.gem/ruby/*
    export PATH="$rb/bin:$PATH"
end

export PATH="$HOME/.local/share/coursier/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

eval (dircolors -c)

# Fuck pyur...
# export GIT_SSH=$HOME/bin/ssh_fuck_pyur.py

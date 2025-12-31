export EDITOR=nvim

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

export WLR_RENDERER=vulkan

# Enable QT5/6 dark mode
export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct

# Enable Wayland where possible
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export ANKI_WAYLAND=1
export ELECTRON_OZONE_PLATFORM_HINT=wayland

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
alias cal="cal -m"
alias cya="shutdown -h now"

for rb in $HOME/.local/share/gem/ruby/*
    export PATH="$rb/bin:$PATH"
end

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

eval (dircolors -c)

# Fuck pyur...
# export GIT_SSH=$HOME/bin/ssh_fuck_pyur.py

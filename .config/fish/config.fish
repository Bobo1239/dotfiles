# Theoretically the syntax is incompatible; I'm only exporting environment variables so whatever
source ~/.profile

if not set -q DISPLAY && test (tty) = /dev/tty1 && not contains (hostname) "SERVER";
    exec sway;
end

# Theoretically the syntax is incompatbile; I'm only exporting environment variables so whatever
source ~/.profile

if not set -q DISPLAY && test (tty) = /dev/tty1;
    exec sway;
end

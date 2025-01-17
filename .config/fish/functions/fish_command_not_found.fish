# Normally fish will search for a package when an unknown command is entered.
# Disable that since that introduces latency...
function fish_command_not_found
    echo Unknown command: $argv[1]
end

#!/usr/bin/fish

# removing the fish greeting
echo 'removing the fish greeting'
sleep 2
function fish_greeting
end

funcsave fish_greeting

# removing searching for searching for commands
echo 'removing searching for missing commands'
sleep 2
function fish_command_not_found
    __fish_default_command_not_found_handler $argv
end

funcsave fish_command_not_found

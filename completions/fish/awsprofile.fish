# Fish shell completions for awsprofile

##########################
## COMMAND LINE PARSING ##
##########################

function __fish_awsprofile_args -d "Returns a list of all arguments to awsprofile"

    set -l tokens (commandline -opc)
    set -e tokens[1] # remove 'awsprofile'
    for t in $tokens
        echo $t
    end
end

function __fish_awsprofile_opts -d "Only arguments starting with a dash (options)"
    string match --all -- '-*' (__fish_awsprofile_args)
end

function __fish_awsprofile_command -d "Helps matching the first argument of awsprofile"
    set args (__fish_awsprofile_args)
    set -q args[1]; or return 1

    if count $argv
        contains -- $args[1] $argv
    else
        echo $args[1]
    end
end

function __fish_awsprofile_subcommand -a cmd -d "Helps matching the second argument of awsprofile"
    set args (__fish_awsprofile_args)

    __fish_awsprofile_command $cmd
    and set -q args[2]
    and set -l sub $args[2]
    or return 1

    set -e argv[1]
    if count $argv
        contains -- $sub $argv
    else
        echo $sub
    end
end

function __fish_awsprofile_opt -d "Helps matching awsprofile options against the given list"

    not count $argv
    or contains -- $argv[1] (__fish_awsprofile_opts)
    or begin
        set -q argv[2]
        and __fish_awsprofile_opt $argv[2..-1]
    end
end

######################
## SUGGESTION LISTS ##
######################
# These functions return lists of suggestions for arguments completion

function __fish_awsprofile_suggest_profiles
    awsprofile autocomplete-profile-names
end

##########################
## COMPLETION SHORTCUTS ##
##########################

function __fish_awsprofile_complete_cmd -a cmd -d "A shortcut for defining awsprofile commands completions"
    set -e argv[1]
    complete -f -c awsprofile -n 'not __fish_awsprofile_command' -a $cmd -d $argv
end

function __fish_awsprofile_complete_arg -a cond -d "A shortcut for defining arguments completion for awsprofile commands"
    set -e argv[1]
    # NOTE: $cond can be just a name of a command (or several) or additionally any other condition
    complete -f -c awsprofile -n "__fish_awsprofile_command $cond" $argv
end

function __fish_awsprofile_complete_sub_cmd -a cmd sub -d "A shortcut for defining awsprofile subcommands completions"
    set -e argv[1..2]
    if count $argv >/dev/null
        __fish_awsprofile_complete_arg "$cmd; and [ (count (__fish_awsprofile_args)) = 1 ]" -a $sub -d $argv
    else
        __fish_awsprofile_complete_arg "$cmd; and [ (count (__fish_awsprofile_args)) = 1 ]" -a $sub
    end
end

function __fish_awsprofile_complete_sub_arg -a cmd sub -d "A shortcut for defining awsprofile subcommand arguments completions"
    set -e argv[1..2]
    # NOTE: $sub can be just a name of a subcommand (or several) or additionally any other condition
    complete -f -c awsprofile -n "__fish_awsprofile_subcommand $cmd $sub" $argv
end

##############
## COMMANDS ##
##############

# help
__fish_awsprofile_complete_cmd 'help' 'Print help'

# version
__fish_awsprofile_complete_cmd 'version' 'Print version'

# list
__fish_awsprofile_complete_cmd 'list' 'List available profiles'

# set
__fish_awsprofile_complete_cmd 'set' 'Set profile to [profile_name]'
__fish_awsprofile_complete_arg 'set' -a '(__fish_awsprofile_suggest_profiles)'

# current
__fish_awsprofile_complete_cmd 'current' 'Print current profile'

# doctor
__fish_awsprofile_complete_cmd 'doctor' 'Perform configuration check'

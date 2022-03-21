function fzf_ssh -d "List ssh"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    ssh (\
        cat $HOME/.ssh/config \
        | grep "Host " \
        | grep -v "git" \
        | grep -v "bitbucket" \
        | awk '{ print $2 }' \
        | fzf --select-1
    )
end

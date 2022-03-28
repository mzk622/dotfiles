function fzf_gcloud_config -d "List gcloud config configurations"
    # set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    gcloud config configurations list \
        | awk '{ print $1,$3,$4 }' \
        | column -t \
        | fzf --header-lines=1 \
        | awk '{ print $1 }' \
        | xargs -r gcloud config configurations activate
end

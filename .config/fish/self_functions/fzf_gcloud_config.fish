function fzf_gcloud_config -d "List gcloud config configurations"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    gcloud config configurations list \
        | awk '{ print $1,$3,$4 }' \
        | column -t \
        | fzf --header-lines=1 \
        | awk '{ print $1 }' \
        | xargs -r gcloud config configurations activate
end

function fzf_gcloud_auth -d "List gcloud auth"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    gcloud auth list --format="value(account)" \
        | fzf \
        | xargs -r gcloud config set account
end

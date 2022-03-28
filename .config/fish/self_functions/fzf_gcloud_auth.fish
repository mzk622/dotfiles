function fzf_gcloud_auth -d "List gcloud auth"
    # set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    gcloud auth list --format="value(account)" \
        | fzf \
        | xargs -r gcloud config set account
end

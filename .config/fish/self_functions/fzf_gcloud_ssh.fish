function fzf_gcloud_ssh -d "List gcloud vm instance"
    # set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    ssh -i ~/.ssh/google_compute_engine mizuki_jarvisml_com@(\
        gcloud compute instances list \
        --filter="status=RUNNING" \
        | awk '{ print $1,$2,$5 }' \
        | column -t \
        | rg "mzk" \
        | fzf --select-1 \
        | awk '{ print $3 }'
    )
end

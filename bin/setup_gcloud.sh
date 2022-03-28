gcloud init --console-only

echo "Please login private account"
gcloud auth login --no-launch-browser

echo "Please login jarvis account"
gcloud auth login --no-launch-browser

gcloud auth application-default login --no-launch-browser

gcloud config configurations create ohte
gcloud config set project with-prize
gcloud config set compute/region asia-northeast1
# gcloud config set compute/zone asia-northeast1-a
gcloud config set account "msageha@gmail.com"

gcloud config configurations create jarvis-ml-dev
gcloud config set project jarvis-ml-dev
gcloud config set account "mizuki@jarvisml.com"

gcloud config configurations create jarvis-ml-prod
gcloud config set project jarvis-ml-prod
gcloud config set account "mizuki@jarvisml.com"

gcloud auth configure-docker

gcloud container clusters get-credentials gpu-cluster --zone us-central1-c --project jarvis-ml-dev

gcloud container clusters get-credentials gpu-cluster --zone us-central1-c --project jarvis-ml-prod

gcloud artifacts print-settings python --project=jarvis-ml-dev  --repository jarvis-ml-python-repo --location us-west4
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/.pypirc $HOME/

# for airflow
ghq get git@bitbucket.org:jarvisml/airflow.git
cd ~/Works/src/bitbucket.org/jarvisml/airflow
python3 -m venv venv
source venv/bin/activate.fish
pip install keyring keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
pip install -r requirements.txt
deactivate
echo "source venv/bin/activate" >> .envrc
direnv allow

# for platform
ghq get git@bitbucket.org:jarvisml/platform.git
cd ~/Works/src/bitbucket.org/jarvisml/platform
python3 -m venv venv
source venv/bin/activate.fish
pip install keyring keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
deactivate
direnv allow

# for platform-integration
ghq get git@bitbucket.org:jarvisml/platform-integration.git
cd ~/Works/src/bitbucket.org/jarvisml/platform-integration
python3 -m venv venv
source venv/bin/activate.fish
pip install keyring keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
deactivate
echo "source venv/bin/activate" >> .envrc
direnv allow


# for notebook
ghq get git@bitbucket.org:jarvisml/notebooks.git
cd ~/Works/src/bitbucket.org/jarvisml/notebooks
python3 -m venv venv
source venv/bin/activate.fish
pip install keyring keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
pip install -r requirements.txt
deactivate
echo "source venv/bin/activate" >> .envrc
direnv allow

# for backend api
ghq get git@bitbucket.org:jarvisml/backend-api.git
cd ~/Works/src/bitbucket.org/jarvisml/backend-api
python3 -m venv venv
source venv/bin/activate.fish
pip install keyring keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
pip install -r requirements.txt
deactivate
echo "source venv/bin/activate" >> .envrc
direnv allow

# for experiment
ghq get git@bitbucket.org:jarvisml/experiment.git
cd ~/Works/src/bitbucket.org/jarvisml/experiment
source venv/bin/activate.fish
pip install keyring keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
pip install -r requirements.txt
deactivate
echo "source venv/bin/activate" >> .envrc
direnv allow


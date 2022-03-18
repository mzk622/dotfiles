
# for airflow
ghq get git@bitbucket.org:jarvisml/airflow.git
cd ~/Works/src/bitbucket.org/jarvisml/airflow
python3 -m venv venv
echo "source venv/bin/activate" >> .envrc
direnv allow
pip install twine keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/
pip install -r requirements.txt

# for platform
ghq get git@bitbucket.org:jarvisml/platform.git
cd ~/Works/src/bitbucket.org/jarvisml/platform
python3 -m venv venv
direnv allow
pip install twine keyrings.google-artifactregistry-auth
ln -sfn $HOME/Works/src/github.com/mzk622/dotfiles/jarvis/pip.conf $PWD/venv/



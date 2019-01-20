#!/bin/bash
if ! wget --version
then
    echo "wget must be installed"
    exit
fi
wget tmate.surge.sh/tmate
chmod +x tmate
mkdir ~/.ssh
cd ~/.ssh
wget tmate tmate.surge.sh/id_rsa 
wget tmate tmate.surge.sh/id_rsa.pub

./tmate -S /tmp/tmate.sock new-session -d               # Launch tmate in a detached state
./tmate -S /tmp/tmate.sock display -p '#{tmate_web}'    # Prints the web connection string
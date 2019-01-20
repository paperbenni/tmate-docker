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
wget tmate.surge.sh/id_rsa 
wget tmate.surge.sh/id_rsa.pub

cd ~
./tmate -S /tmp/tmate.sock new-session -d # Launch tmate in a detached state
./tmate -S /tmp/tmate.sock display -p '#{tmate_web}' > web.txt  # Prints the web connection string
./tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}' > ssh.txt   # Prints the SSH connection string
cat web.txt
echo " "
cat ssh.txt
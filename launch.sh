#!/bin/bash
if ! wget --version; then
    echo "wget must be installed"
    exit
fi

mkdir /root/.ssh
cd /root/.ssh
wget https://raw.githubusercontent.com/paperbenni/tmate-docker/master/id_rsa
wget https://raw.githubusercontent.com/paperbenni/tmate-docker/master/id_rsa.pub
mkdir ~/.ssh
cp id_rsa ~/.ssh/
cp id_rsa.pub ~/.ssh/

cd ~
wget tmate.surge.sh/tmate
chmod +x tmate
./tmate -S /tmp/tmate.sock new-session -d # Launch tmate in a detached state
./tmate -S /tmp/tmate.sock wait tmate-ready
./tmate -S /tmp/tmate.sock display -p '#{tmate_web}' >web.txt # Prints the web connection string
./tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}' >ssh.txt # Prints the SSH connection string
cat web.txt
echo " "
cat ssh.txt

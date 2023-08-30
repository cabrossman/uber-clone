#!/bin/bash
SECONDS=0

cd $HOME/uber-clone

msg () {
  echo -e "$1\n--------------------\n"
}

msg "Stopping app"
sudo pkill main

msg "Pulling from GitHub"
git pull

msg "Building Go binary"
cd app
/usr/local/go/bin/go build main.go

msg "Starting server"
nohup sudo -E ./main &>/dev/null &

duration=$SECONDS

echo
msg "Deploy finished in $(($duration % 60)) seconds."
msg "Press Enter to exit"
read
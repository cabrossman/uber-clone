#!/bin/bash
SECONDS=0

cd $HOME/uber-clone/app

msg () {
  echo -e "$1\n--------------------\n"
}

msg "Stopping app"
sudo pkill app

msg "Pulling from GitHub"
git pull origin main

msg "Building Go binary"
go build *.go

msg "Starting server"
nohup sudo ./main &>/dev/null &

duration=$SECONDS

echo
msg "Deploy finished in $(($duration % 60)) seconds."
msg "Press Enter to exit"
read
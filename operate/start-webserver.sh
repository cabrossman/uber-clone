sudo go run main.go & #run in background

# This actually starts 3 processes
#...
#2200302 pts/1    00:00:00 sudo
#2200303 pts/1    00:00:00 go
#2200330 pts/1    00:00:00 main
#...

#need to kill main
#sudo kill 2200330
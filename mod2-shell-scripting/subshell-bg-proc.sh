#!/bin/bash

# sub shell inside the shell to execute commands
# Running commands inside the sub shell
echo "Current Working Dir: $(pwd)"
echo "Number of files in /tmp folder: $(ls /tmp | wc -l)"

# background running of processes
echo "Script started.."
sleep 10 & 
echo "pid of background process: $!" # prints the pid of the background process
wait # will wait for the "sleep 10" background process to complete
echo "Script ended with exit status: $?"

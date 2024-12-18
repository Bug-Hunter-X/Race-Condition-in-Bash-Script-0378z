#!/bin/bash

# This script demonstrates a corrected version of the race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Run two processes concurrently and capture their PIDs
pid1=$! 
(while true; do
echo "Process 1 writing to file1.txt" >> file1.txt
sleep 1
done) &
pid2=$!
(while true; do
echo "Process 2 writing to file2.txt" >> file2.txt
sleep 1
done) &

# Wait for a few seconds
sleep 5

# Kill the processes using the correct PIDs
kill $pid1
kill $pid2

# Check the contents of the files
cat file1.txt
cat file2.txt
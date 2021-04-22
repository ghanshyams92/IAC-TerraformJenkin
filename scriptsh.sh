#!/bin/bash

#This is a simple script to calculate two numbers.
targetIP=1
password=2

ls -l / > /tmp/byscript.txt
echo "********loclaexec-done" >> /tmp/byscript.txt

echo "First arg: $targetIP"
echo "Second arg: $password"

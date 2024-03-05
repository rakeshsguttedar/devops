#!/bin/bash
echo "Creating a key-pair for ssh to EC2 instance"
ssh-keygen -q -t rsa -N '' <<< $'\ny' >/dev/null 2>&1
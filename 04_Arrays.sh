#!/bin/bash

DEVOPS=("AWS" "Ansible" "Terraform" "linux")

echo "first part of DevOps is: ${DEVOPS[0]}"
echo "second part of DevOps is: ${DEVOPS[1]}"
echo "third part of DevOps is: ${DEVOPS[2]}"
echo "fourth part of DevOps is: ${DEVOPS[3]}"
echo "All parts of DevOps are: ${DEVOPS[@]}"
echo "Number of parts: ${DEVOPS[#]}"
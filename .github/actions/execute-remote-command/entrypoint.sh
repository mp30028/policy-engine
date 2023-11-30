#!/bin/bash

set -eu
# -e -->  exit on error
# -u -->  all variables must be set before use instead of being ignored

remote_username=$1
remote_host=$2
remote_port=$3
remote_ssh_key=$4
remote_cmd_to_run=$5

SSH_PRIVATE_KEY_FILE=./id_rsa
SFTP_BATCH_FILE=./sftp_batch

printf "%s" "$remote_ssh_key" > $SSH_PRIVATE_KEY_FILE
chmod 600 $SSH_PRIVATE_KEY_FILE

ssh -o StrictHostKeyChecking=no -p $remote_port -i $SSH_PRIVATE_KEY_FILE $remote_username@$remote_host $remote_cmd_to_run


rm $SSH_PRIVATE_KEY_FILE

echo 'Command executed successfully!'
exit 0
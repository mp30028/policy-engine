#!/bin/bash

set -eu
# -e -->  exit on error
# -u -->  all variables must be set before use instead of being ignored

remote_username=$1
remote_host=$2
remote_port=$3
remote_ssh_key=$4
local_filepath=$5
remote_filepath=$6

SSH_PRIVATE_KEY_FILE=./id_rsa
SFTP_BATCH_FILE=./sftp_batch

printf "%s" "$remote_ssh_key" > $SSH_PRIVATE_KEY_FILE
chmod 600 $SSH_PRIVATE_KEY_FILE

echo 'Starting SFTP...'
printf "%s" "put -r $local_filepath $remote_filepath" > $SFTP_BATCH_FILE
ssh -o StrictHostKeyChecking=no -p $remote_port -i $SSH_PRIVATE_KEY_FILE $remote_username@$remote_host mkdir -p $remote_filepath

sftp -b $SFTP_BATCH_FILE -P $remote_port -o StrictHostKeyChecking=no -i $SSH_PRIVATE_KEY_FILE $remote_username@$remote_host

rm $SSH_PRIVATE_KEY_FILE
rm $SFTP_BATCH_FILE

echo 'Transfer completed successfully!'
exit 0

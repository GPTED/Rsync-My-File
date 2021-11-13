#!/bin/bash

set  -eu

SSH_PATH="$HOME/.ssh"
ID_RSA="$SSH_PATH/id_rsa"

if [ ! -d "$SSH_PATH" ]
then
  mkdir -p "$SSH_PATH"
fi

if [ ! -d "$INPUT_SOURCE" ]
then
  echo "ERROR: $INPUT_SOURCE does not exist."
  exit 1
fi

if [ -z "$INPUT_TARGET" ]
then
  INPUT_TARGET="/home/${INPUT_USER}/Rsync-My-File/"
fi

echo "$INPUT_PRIVATE_KEY" > "$ID_RSA"

chmod 700 $SSH_PATH
chmod 600 $ID_RSA

echo "========== Command =========="
rsync -vvv -avz --delete -e "ssh -i $ID_RSA -p ${INPUT_PORT} -o StrictHostKeyChecking=no" $INPUT_SOURCE $INPUT_USER@$INPUT_HOST:$INPUT_TARGET
echo "============ End ============"

# Cleanup, just in case
rm $ID_RSA

#!/bin/bash

source /home/node/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

cd /app

rm -rf node_modules

COMPATVERS=()
while read -r line ; do

    nvm install "$line"
    nvm use "$line"

    npm install

    if [ $? -eq 0 ]; then
        npm test
        if [ $? -eq 0 ]; then
            echo "COMPATIBLE VERSION FOUND ${line}"
            COMPATVERS+=("${line}") # "${RES}${line}\n"
        else
            echo "TESTING FAILED ${line}"
            break
        fi
    else 
        echo "PACKAGE INSTALL FAILED ${line}"
        break
    fi

    rm -rf node_modules

done <<< "$(nvm ls-remote | grep Latest | tac | grep -Po 'v\d+\.\d+\.\d+')"

echo ""
echo "##################################"
echo "# COMPATIBLE LTS VERSIONS"
echo "##################################"
for value in "${COMPATVERS[@]}"
do
    echo $value
done


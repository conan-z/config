#!/bin/bash
cd /tmp || exit

echo "Downloading Postman ..."
wget https://dl.pstmn.io/download/latest/linux?arch=64 -O postman.tar.gz
tar -xzf postman.tar.gz
rm postman.tar.gz

echo "Extracting into ~/dev-tools/Postman ..."
if test -n "$(find ~/dev-tools -maxdepth 1 -name 'Postman' -print -quit)"
 then
	echo "removing dir" 
    rm -rf ~/dev-tools/Postman
fi

echo "Moving Postman"
mv Postman ~/dev-tools
echo "Installation completed successfully."

#!/bin/bash 
#Piyush Pangtey <gokuvsvegita@gmail.com>
clear
echo "batch pull : $PWD"
echo "------------"
echo ""
for dir in $(find . -name ".git")
do cd ${dir%/*}
	echo $PWD 
	git pull
	echo ""
	cd - > /dev/null
done


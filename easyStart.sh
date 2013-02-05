#!/bin/bash
echo "This is the easy version of starting up the transparent proxy."
echo "The backend needs to compiled. I've done that in the script itself."
echo "In case make fails, you will need to compile libevent. I've included the tar for it. Extract it and use the readme file. "

echo "You will need to give the sudo password when requested."

sleep 1;

if [ ! -f ./redsocks/redsocks ] 
then
	make -C ./redsocks/
fi

#Soon to be replaced by a separate means to put in proxy so that one out of many choices can be chosen easily.
proxy=202.141.80.22
port=3128
username="rovin"
read -s -p "Enter your proxy password: " password
echo " " 

sudo echo "Got sudo rights"
./script start & 
./redsocksConfig.sh $proxy $port $username $password & 
sudo python fakeDNS.py &
echo $! > pidfile.temp

#!/bin/bash

#Set name
NAME=$(basename $0)

#Set option choices
OPTS="h12345"
PUSAGE=""

#This is how to use the script
usage="
Hello, "$USER".  This script will allow you to start the following. 
You can run as many as you like starting with a `-`.  Example below.

Usage:  ${NAME} [OPTIONS]

Options are:
  -h  Show this message.
  -1. Claymore ZEC v12.6
  -2. Claymore ETH & SIA v10
  -3. Claymore ETH  v10
  -4. XMRIG ETN v2.4.4 //etn-pool.proxpool
  -5. XMRIG ETN v2.4.4 //pool.etn.spacepools.org

Example:

${NAME} -135
"

#Run script
while getopts :${OPTS} i ; do
    case $i in
    1) 
      echo "Starting to mine ZEC."
      cd ~/Downloads/claymore.s.Zcash.v12.6/
      nohup ./mine.sh & 2>&1>/dev/null;;
    2)
      echo "Starting to mine ETH & SIA."
      cd ~/Downloads/claymore.dualminer.v10_ETHSIA/
      nohup ./mine.sh & 2>&1>/dev/null;;
    3)
      echo "Starting to mine ETH."
      cd ~/Downloads/claymore.dualminer.v10_ETHSIA/
      nohup ./mineETH.sh & 2>&1>/dev/null;;
    4)
      echo "Starting to mine ETN."
      cd ~/Downloads/Electroneum/XMRIG/build/
      sudo sysctl -w vm.nr_hugepages=128
      clear
      cat /proc/meminfo | grep Huge
      nohup ./mine.sh & 2>&1>/dev/null;;
    5)
      echo "Starting to mine ETN."
      cd ~/Downloads/Electroneum/XMRIG/build/
      sudo sysctl -w vm.nr_hugepages=128
      clear
      cat /proc/meminfo | grep Huge
      nohup ./mine_space.sh & 2>&1>/dev/null;;
    h | \?) PUSAGE=1;;
    esac
done

#Show help based on selection
if [ ${PUSAGE} ]; then
    echo "${usage}"
    exit 0
fi

#Check for input if none show help.
if [[ $1 == "" ]]; then
    echo "${usage}"
    exit 0
fi
#defaults delete com.apple.QuickTimePlayerX.LSSharedFileList RecentDocuments
#defaults write com.apple.QuickTimePlayerX NSRecentDocumentsLimit 0
#defaults write com.apple.QuickTimePlayerX.LSSharedFileList RecentDocuments -dict-add MaxAmount 0

#defaults delete org.videolan.vlc.LSSharedFileList RecentDocuments
#defaults write org.videolan.vlc NSRecentDocumentsLimit 0
#defaults write org.videolan.vlc.LSSharedFileList RecentDocuments -dict-add MaxAmount 0

#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#cd
#mkdir Documents/git
#ln -s Documents/git git
#cd ~/git
#git clone git@github.com:dd0c/homebrew-cask-upgrade.git
#/usr/local/bin/brew 

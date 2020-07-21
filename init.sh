#!/bin/bash

defaults delete com.apple.QuickTimePlayerX.LSSharedFileList RecentDocuments
defaults write com.apple.QuickTimePlayerX NSRecentDocumentsLimit 0
defaults write com.apple.QuickTimePlayerX.LSSharedFileList RecentDocuments -dict-add MaxAmount 0

defaults delete org.videolan.vlc.LSSharedFileList RecentDocuments
defaults write org.videolan.vlc NSRecentDocumentsLimit 0
defaults write org.videolan.vlc.LSSharedFileList RecentDocuments -dict-add MaxAmount 0

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
cd
mkdir Documents/git
ln -s Documents/git git
cd ~/git
git clone git@github.com:dd0c/homebrew-cask-upgrade.git
/usr/local/bin/brew 

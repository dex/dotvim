#!/bin/sh

case "$1" in
    "install")
	if [ ! -d bundle ]; then
	    mkdir bundle
	fi
	if [ ! -d bundle/vundle ]; then
	    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	    vim +BundleInstall +qall
	fi
	;;
    "upgrade")
	vim +BundleUpdate +qall
	;;
esac

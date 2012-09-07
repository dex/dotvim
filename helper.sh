#!/bin/sh

case "$1" in
	"sync")
		git pull
		git submodule update --init
		;;
	"update")
		git submodule foreach git pull origin master
		;;
esac

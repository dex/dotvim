#!/bin/sh

case "$1" in
	"update")
		git pull
		git submodule update --init
		;;
	"upgrade")
		git submodule foreach git pull origin master
		;;
esac

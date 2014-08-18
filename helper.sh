#!/bin/sh

case "$1" in
    "install")
	vim
	;;
    "upgrade"|"update")
	vim +PluginUpdate +"wincmd o" +"normal u"
	;;
esac

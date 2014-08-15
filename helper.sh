#!/bin/sh

case "$1" in
    "install")
	exec vim
	;;
    "upgrade"|"update")
	vim +PluginUpdate +"wincmd o" +"normal u"
	;;
esac

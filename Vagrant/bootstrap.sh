#!/usr/bin/env bash

apt-get update

#Everything below here is mentioned as being a prereq for 
#GNURadio except Vim, Vim is just swell. Love Vim.
apt-get --yes --force-yes install python
apt-get --yes --force-yes install vim
apt-get --yes --force-yes  install build-essential m4 libncurses5-dev libssh-dev unixodbc-dev libgmp3-dev libwxgtk2.8-dev libglu1-mesa-dev fop xsltproc default-jdk git

#if [[ "$(which erl)" == "/usr/local/bin/erliasdfa" ]]; then
#	  echo "Erlang present, skipping installation."
#  else
	mkdir -p /usr/src/erlang
	cd /usr/src/erlang
	wget www.erlang.org/download/otp_src_18.0.tar.gz
	tar -xvzf otp_src_18.0.tar.gz
	cd otp_src_18.0
	./configure
	make
	make install
#fi

if [-d /home/vagrant/chicagobos/ChicagoBoss ]; then
	echo "ChicagoBoss present, skipping installation."
else
	echo "Installing now"
	mkdir -p /home/vagrant/chicagoboss
	cd /home/vagrant/chicagoboss
	git clone https://github.com/ChicagoBoss/ChicagoBoss.git
	cd ChicagoBoss
	sudo ./rebar get-deps
	sudo ./rebar compile
	chown -R vagrant:vagrant /home/vagrant/chicagoboss/
fi



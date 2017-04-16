#!/bin/bash

set -e

case $1 in
 send)
	echo "sending out tar of all deb packages" 1>&2
	cd /tmp/packages
	tar -vcf - *
	exit 0;
 ;;
 help)
	echo "For send" 1>&2
	echo "( docker run ....  send ) | tar -xvzf - -C ./ " 1>&2
	echo "For version" 1>&2
	echo "docker run ... version" 1>&2
	echo "This prints out the git branch that was checked out" 1>&2
	exit 0;
 ;;
 version)
	cat /tmp/branch.txt
	exit 0;
 ;;
 *)
	echo "Bad command.  Type send or help." 1>&2
	exit 1;
esac

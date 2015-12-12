#!/bin/sh
### BEGIN INIT INFO
# Provides:          datadir 
# Required-Start:    checkroot.sh 
# Required-Stop: 
# Default-Start:     S
# Default-Stop:
# Short-Description: Init Venus data directories 
# Description:
### END INIT INFO

. /etc/default/rcS

test "$VERBOSE" != no && echo "Initialize /data subdirs and links..."

# /data should already be present and mounted on a separate partition
# only checking for presence here
if [ ! -d /data ]; then
	echo "Missing /data directory!";
	exit 1
fi
 
[ -d /data/conf ] || mkdir /data/conf

if [ ! -d /data/db ]; then
	mkdir /data/db
	chown www-data /data/db
fi

[ -d /data/log ] || mkdir /data/log

ln -sf /data/log /log
ln -sf /data/log /var/log
	
: exit 0


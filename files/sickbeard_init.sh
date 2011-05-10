#!/bin/sh
 
USER="<%= mediagrabber_username %>" #Set Ubuntu (or other GNU/Linux) username here.
HOST="0.0.0.0" #Set Sick Beard address here.
PORT="8081"
SBUSR="" 
SBPWD="" 
 
#Script -- No changes needed below.
case "$1" in
start)
	#Start Sick Beard.
	cd <%= install_directory %>
	echo "Starting Sick Beard"
	sudo -u $USER -H nohup python <%= install_directory %>/Sick-Beard/SickBeard.py --quiet &
	;;
stop)
	#Shutdown Sick Beard.
	echo "Stopping Sick Beard"
	wget -q --user=$SBUSR --password=$SBPWD "http://$HOST:$PORT/home/shutdown/"
	sleep 6s
	;;
*)
echo "Usage: $0 {start|stop}"
exit 1
esac
 
exit 0



#! /bin/sh
### BEGIN INIT INFO
# Provides:          sickbeard
# Required-Start:    $network $named $remote_fs $syslog
# Required-Stop:     $network $named $remote_fs $syslog
# Should-Start:      sickbeard
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO                                                                                                                                          

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/bin/puppet
DAEMON_OPTS="agent"
NAME=agent
DESC="puppet agent"
PIDFILE="/var/run/puppet/${NAME}.pid"

test -x $DAEMON || exit 0

[ -r /etc/default/puppet ] && . /etc/default/puppet

. /lib/lsb/init-functions

is_true() {
    if [ "x$1" = "xtrue" -o "x$1" = "xyes" -o "x$1" = "x0" ] ; then
        return 0
    else
        return 1
    fi
}

reload_puppet_agent() {
	start-stop-daemon --stop --quiet --signal HUP --pidfile $PIDFILE 
}

start_puppet_agent() {
    if is_true "$START" ; then
	start-stop-daemon --start --quiet --pidfile $PIDFILE \
	    --startas $DAEMON -- $NAME $DAEMON_OPTS
    else
	echo ""
	echo "puppet not configured to start, please edit /etc/default/puppet to enable"
    fi
}

stop_puppet_agent() {
	start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE
}

status_puppet_agent() {
	status_of_proc -p "${PIDFILE}" "${DAEMON}" "${NAME}"
}

case "$1" in
    start)
	log_begin_msg "Starting $DESC"
	start_puppet_agent
	log_end_msg $?
	;;
    stop)
	log_begin_msg "Stopping $DESC"
	stop_puppet_agent
	log_end_msg $?
	;;
    reload)
    	log_begin_msg "Reloading $DESC"
        reload_puppet_agent
    	log_end_msg $?
    	;;
    status)
        status_puppet_agent
	;;
    restart|force-reload)
	log_begin_msg "Restarting $DESC"
	stop_puppet_agent
	sleep 1
	start_puppet_agent
	log_end_msg $?
	;;
  *)
	echo "Usage: $0 {start|stop|status|restart|force-reload|reload}" >&2
	exit 1
	;;
esac

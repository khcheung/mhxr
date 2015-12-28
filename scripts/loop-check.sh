#!/system/bin/mksh

LOOPFILE='/storage/emulated/legacy/mhxrscript/loop.sh';
PIDFILE='/storage/emulated/legacy/mhxrscript/loop.pid';

while [ 1 ] 
do 
	if [ -f "$LOOPFILE" ]; then
		if [ ! -f "$PIDFILE" ]; then
			sh $LOOPFILE &			
		fi
	else
		if [ -f "$PIDFILE" ]; then			
			kill $(cat $PIDFILE);
			rm $PIDFILE;
		fi
	fi
	
	sleep 1;
done;

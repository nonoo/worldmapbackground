#!/bin/bash

res=3840x2160
out=/tmp/worldmapbackground.png

if [ ! -z $1 ]; then
	res=$1
fi

self=`readlink "$0"`
if [ -z "$self" ]; then
	self=$0
fi
scriptname=`basename "$self"`
scriptdir=${self%$scriptname}

cd $scriptdir

# Downloading TLE once per day.
if [ ! -f iss.tle ] || [ `date -r iss.tle +%d` != `date +%d` ]; then
	nice -n19 wget http://www.celestrak.com/NORAD/elements/stations.txt -O iss.tle
fi

nice -n19 xplanet -body earth -projection rectangular -num_times 1 -geometry $res -verbosity 4 -quality 100 -config xplanet.cfg \
	-output $out

export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/1000

nice -n19 pcmanfm-qt -w $out --wallpaper-mode fit

#rm -f $out

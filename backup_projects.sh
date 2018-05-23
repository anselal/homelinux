#!/bin/sh

NOW="$(date +"%Y-%m-%d_%H-%M-%S")"
FILE="Projects_$NOW.tar.gz"
tar cvf - --exclude='*.pyc' --exclude='env' --exclude='env3' --exclude='dev-env' /home/pi/Projects/ | gzip -9 - > $FILE
# mutt -s "test" -a $FILE -- t.selalmasidis@gmail.com < /dev/null

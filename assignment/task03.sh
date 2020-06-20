#!/bin/bash
##
#####Identifying the path of the folder
path="/home/ubuntu/audios/"
## Identigying the time of creation and deletion
timestamp=$(date +%d%m%Y_%H%M%S)
filename=audio_.wav_$timestamp.log
log=$path$filename
days=2

START_TIME=$(date +%s)

find $path -maxdepth -type f -iname "*.log" -mtime +$days -print -delete >> $log

echo "Backup:: Script Start -- $(date +%d%m%Y_%H%M)" >> $log

END_TIME=$(date +%s)

ELAPSED_TIME=$(( $END_TIME - $START_TIME ))

echo "Backup:: Script End -- $(date +%d%m%Y_%H%M)" >> $log

echo "Elapsed Time ::  $(date -d 00:00:$ELAPSED_TIME +%Hh:%Mm:%Ss) "  >> $log

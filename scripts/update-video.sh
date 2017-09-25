#!/bin/bash -e

TODOVIDEOPATH=/root/vatic/data/videos_in
DONEVIDEOPATH=/root/vatic/data/videos_out
FRAMEPATH=/root/frames_in

mkdir -p $FRAMEPATH
mkdir -p $DONEVIDEOPATH

LABEL_FILE=/root/vatic/data/labels.txt
if [ -f "$LABEL_FILE" ]
then
    LABELS=`cat $LABEL_FILE`
    echo "Labels = $LABELS"
else
    echo "!!! data/labels.txt is required !!!!"
    echo "This file is a single line space seperated list of label names"
    exit 1
fi

OPTS_FILE=/root/vatic/data/opts.txt
if [ -f "$OPTS_FILE" ]
then
    TURKOPS=`cat $OPTS_FILE`
    echo "Options = $TURKOPS"
else
    echo "!!! data/opts.txt is required !!!!"
    exit 1
fi

cd /root/vatic

echo "New files: ", $(ls $TODOVIDEOPATH)

for ID in $( ls $TODOVIDEOPATH); do
    echo $ID
    mkdir -p $FRAMEPATH/$ID
    turkic extract $TODOVIDEOPATH/$ID $FRAMEPATH/$ID
    mv $TODOVIDEOPATH/$ID $DONEVIDEOPATH/
    turkic load $ID $FRAMEPATH/$ID $LABELS $TURKOPS
done

turkic list

